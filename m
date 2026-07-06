Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A5B3EFFD0
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 08:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326174; cv=none; b=OmzDyBXGikPh7ZGeA8jmbfGLYqNEp/PkN4wag5lAS5fJG0C48WMDeYcEj6Wn6lPeUOrmkS8FLLcfhFqe7nAWjjeITyCns1ZZdCmkGYYh47IM4HbHN5FmLP9Up3MQQOJI2+sYNJK/NUOfvYPgOlfIUn8EhpKKJtstknlVFHryew0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326174; c=relaxed/simple;
	bh=o/sNQR5LZGDkyJ4EvrA/HWAL0Z7LOSlQgm1toN7Mxqk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=W4aDzxJiHVXruVXZElkFYYyk499O2XrutlPi0bQshXHeoaN7dQ9ndgQAV2/8HWfqwmZ3JCjGR/HejFFll7PuOogwbZmdoyU5//0ks+Hgks4s/dH9odduckyWdSghtTomFcmxlYJ1T9dufMucXKSI5OnMgKhqSZhK6/SaDfzlVsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 16:22:24 +0800
Message-Id: <DJRCCWQOT4TA.1OPAZI88KOWLW@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
 <imx@lists.linux.dev>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 0/9] drm: replace simple display pipe users with atomic
 helpers
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: "Thomas Zimmermann" <tzimmermann@suse.de>, "Ze Huang"
 <ze.huang@oss.qualcomm.com>, "Alexey Brodkin" <abrodkin@synopsys.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Joel Stanley" <joel@jms.id.au>, "Andrew Jeffery"
 <andrew@codeconstruct.com.au>, "Frank Li" <Frank.Li@nxp.com>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Linus
 Walleij" <linusw@kernel.org>, "Hans de Goede" <hansg@kernel.org>, "Alex
 Lanzano" <lanzano.alex@gmail.com>, "Oleksandr Andrushchenko"
 <oleksandr_andrushchenko@epam.com>
References: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com> <9612bb41-db52-4169-a7fa-e57268d69e24@suse.de>
In-Reply-To: <9612bb41-db52-4169-a7fa-e57268d69e24@suse.de>
X-Migadu-Flow: FLOW_OUT

On Mon Jul 6, 2026 at 3:27 PM CST, Thomas Zimmermann wrote:
> Hi
>
> Am 04.07.26 um 20:31 schrieb Ze Huang:
>> struct drm_simple_display_pipe was meant to simplify simple DRM
>> drivers, but instead adds an extra wrapper around normal DRM atomic
>> helper setup. As noted in Documentation/gpu/todo.rst, remaining users
>> should be converted to regular atomic helpers and stop depending on the
>> simple-KMS interfaces.
>>
>> This series converts the following drivers:
>>
>>    - arcpgu
>>    - aspeed
>>    - imx lcdc
>>    - mcde
>>    - pl111
>>    - gm12u320
>>    - repaper
>>    - tve200
>>    - xen frontend
>>
>> Each patch replaces drm_simple_display_pipe_init() with explicit
>> primary plane, CRTC and encoder setup, and moves the old simple-pipe
>> callbacks into regular plane and CRTC helper callbacks named according
>> to local driver conventions.
>>
>> The conversions preserve helper behavior that used to be implicit in
>> drm_simple_kms_helper.c, including plane-state validation, CRTC
>> primary-plane checks, affected-plane propagation, framebuffer prepare
>> handling, and existing event/vblank flow where applicable.
>>
>> Result is less helper indirection and more explicit driver-side atomic
>> wiring, with no remaining simple-KMS dependency in these drivers.
>>
>> These changes are build-tested only. No hardware testing has been
>> performed on the affected devices.
>
> Thanks a lot for the series. That's quite a nice cleanup.=C2=A0 Did you u=
se=20
> any AI to create these patches?
>

Hi Thomas,

Yes, I did. I wrote the first two conversion patches (arcpgu and
aspeed) myself to understand the migration pattern. For the remaining
drivers, I used GPT-5.5 to help with the repetitive boilerplate
conversion.

I should have reviewed the generated code more carefully before sending
the series. The sashiko-bot feedback shows that I missed several important
details, including commit-local state handling, the implicit NULL fb /
visibility checks from simple-KMS, and vblank/pageflip event ordering.
I am now going through these issues more carefully and working out the
correct fixes before sending a v2.

Do you expect AI assistance to be mentioned in the cover letter or commit
messages in some specific form? If there is a preferred tag or wording
for this, I will use it in v2.

For issues that appear to be pre-existing but are exposed or carried over
by the migration, which is better?

1. Include them as separate prep/fix patches at the beginning of the v2
series, before the corresponding conversion patches; or
2. address those pre-existing issues in a separate follow-up series?

Thanks for your time and review. :)

> Best regards
> Thomas
>

Best regards,
Ze
