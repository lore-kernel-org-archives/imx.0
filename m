Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5528531F989
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 01:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785116240; cv=none; b=cl/nT8n3ltGrP517xgT5b+ZGFiPO09WLxK7VQISVOwzUqEgRdV0lGANlKf6ngWSRZAleVtcutmeP9ZUCYNSuv96CZhf3RvW88TDgSquZw1rfAwWxEDLbc48PNofTAa59XiqMTgoDEaiUugnBKcGI9nUN16fC2B3Khb4YNKqkNpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785116240; c=relaxed/simple;
	bh=o3I//fWT/Ahu1TRVuSuKOsa5VptGAjlzU/RAQ0KA2Gs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=cCcR6M6s66eqtPt4VG/q/gsqSCorftBqfvedli3XBP7yDxWe8xuy5F6h8jpjhNWjdlpJ9/8p0Xe4SfxyHByBKRYD1ChQDEBMNHaca0HpPsQPw+nN2aMuii9Vp8KDU0tde3v6Fsrtdy1cRBVviK9JMWAM56Xa/eR/ffZPQb1xTA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.172
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
Date: Mon, 27 Jul 2026 09:37:03 +0800
Message-Id: <DK8YVZNAFKSP.1JHSI6NI6LLYZ@oss.qualcomm.com>
Cc: "Alexey Brodkin" <abrodkin@synopsys.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Joel Stanley"
 <joel@jms.id.au>, "Andrew Jeffery" <andrew@codeconstruct.com.au>, "Frank
 Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Hans de Goede" <hansg@kernel.org>, "Alex Lanzano"
 <lanzano.alex@gmail.com>, "Oleksandr Andrushchenko"
 <oleksandr_andrushchenko@epam.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
 <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 0/8] drm: replace simple display pipe users with
 atomic helpers
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: "Linus Walleij" <linusw@kernel.org>, "Ze Huang"
 <ze.huang@oss.qualcomm.com>
References: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com> <CAD++jL=x2Ya_MXrO7FGF6WDzr4dv83K8-TS2AWkA2O0Dko8G4g@mail.gmail.com>
In-Reply-To: <CAD++jL=x2Ya_MXrO7FGF6WDzr4dv83K8-TS2AWkA2O0Dko8G4g@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Mon Jul 27, 2026 at 4:32 AM CST, Linus Walleij wrote:
> Hi Ze,
>
> On Sun, Jul 26, 2026 at 9:45=E2=80=AFPM Ze Huang <ze.huang@oss.qualcomm.c=
om> wrote:
>
>> struct drm_simple_display_pipe was meant to simplify simple DRM
>> drivers, but instead adds an extra wrapper around normal DRM atomic
>> helper setup. As noted in Documentation/gpu/todo.rst, remaining users
>> should be converted to regular atomic helpers and stop depending on the
>> simple-KMS interfaces.
>
> Are these patches independent of other stuff so they can be tested on
> top of v7.2-rc1 or do they need other stuff from drm-misc-next?
>
> Yours,
> Linus Walleij

Hi Linus, patches are independent and can be tested on v7.2-rc1.

I've seen others patches based on drm tree so I did the same. Would
switch to v7.2-rc1 if that's preferred :)

Thanks,
Ze Huang
