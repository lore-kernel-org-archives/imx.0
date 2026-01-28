Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15626280CF6
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 15:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769613996; cv=none; b=SsJGJf2ux0vDYYn0xd0DiM/Kta2koG16UHcqUeKo0KVcJrOTRnvse7xRNI3mP6bVw0+mte9D6Vs+sTzluP9Jls7OVQBbQ5um+WVmlX52BP+cWQfSIIcERLpucZQ3f+p6u+YYUQbyhtqdL3ouFrY0OPz8M6QAyKPYWTZHbLA8/48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769613996; c=relaxed/simple;
	bh=HLINDo9uBCCVftpffN6WJlzSnRqepVuRmgi8TqtmP/w=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=k+BYMGiiQlUiEWECxRh5Zz7Hu2sapnOAU+cTnvUSzbsLyNydO8FU3Agw7Ra9xlgCJv/zlepyRJyIYGXSg4MCKREwa1OpkN9bmsC4sIkfZfoBc1WYlNy+PXS49zsA9ShM0LMExT6AYuO6A9KbAtFUZWK60fcBN3EnJnXDPQJqMLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZBrv5OTs; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZBrv5OTs"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 21DE51A2ACD;
	Wed, 28 Jan 2026 15:26:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D8D176071F;
	Wed, 28 Jan 2026 15:26:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 09B66119A86D4;
	Wed, 28 Jan 2026 16:26:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769613989; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ifdIKBALmrDtlGji95Dn4uLjAd1QzXtIVq+J3SL2uiM=;
	b=ZBrv5OTsxnvC31C9xB5u3t92JpXYvSfGTBtbzpE1nwuHruAK57TjVcGMS3APCHv4l9SF/E
	wnqAQ55EFsg6Uj8+Ym01dWq/BJk9kjEcjm3JoqkQjhOyiTejWsxXKc9iZ6Utsubt6Y4bzq
	cqdqoHfypaQthCvQtpBCwD5UR+Mrs/C+MyqWvVgQ8NfmSW0KnRnaztVhOs2s/Pk6EGyLqc
	+qNIkWAByljlRPA9ZsxpbMXwdVOfJA1pNsG5HdTOzd4POa95lQpTLenMXpI2+eS7+mdf9W
	v03OkG2M3vHFVTUlnyDCCl7Ch2B+i2I0bsHAaRRmhM5ozz4ujvb/gEq/asKfVQ==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 16:26:22 +0100
Message-Id: <DG0BSWR9XRZS.29D743F5RWI8N@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: (subset) [PATCH 0/3] drm/bridge: imx: A few fixes
Cc: <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>
X-Mailer: aerc 0.20.1
References: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
 <176951374753.94588.10653964166300906894.b4-ty@bootlin.com>
 <f11d4407-9951-40a3-bde5-583ca1ca5bc5@nxp.com>
In-Reply-To: <f11d4407-9951-40a3-bde5-583ca1ca5bc5@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Liu,

On Wed Jan 28, 2026 at 2:50 AM CET, Liu Ying wrote:
> Hi Luca,
>
> On Tue, Jan 27, 2026 at 12:35:47PM +0100, Luca Ceresoli wrote:
>>
>> On Fri, 23 Jan 2026 17:22:14 +0800, Liu Ying wrote:
>>> This patch series contains 3 bug fixes for i.MX8QXP DRM bridges.
>>> Each patch fixes a NULL pointer dereference issue and stands alone.
>>>
>>>
>>
>> Applied, thanks!
>>
>> [1/3] drm/bridge: imx8qxp-ldb: Fix NULL pointer dereference in imx8qxp_l=
db_bridge_destroy()
>>       commit: 852c68bf42965ee38b465d2d6f7b965eb0b5dc1d
>> [2/3] drm/bridge: imx8qxp-pxl2dpi: Fix NULL pointer dereference in imx8q=
xp_pxl2dpi_bridge_destroy()
>>       commit: db7e7ea838c916ee4cdf26bee126fd36f58295dc
>
> Any reason why patch 3/3 is not applied?

Yes, the reason is there's a patch conflict and I still have to find out
how to handle it.

Patch 3 by the rules [0] should go to drm-misc-fixes because the bug (added
by [1]) is already on Linus' master tree (since v6.17), but it does not
apply there due to a conflict with an unrelated change [2] currently on
drm-misc-next.

Note that [1] and [2] are the two commits mentioned in your 'Fixes: 'tags.

I had a chat with Maxime on #dir-devel about how to handle this situation
but still haven't got a final answer.

I guess the correct way is:

 1. apply patch 3 on drm-misc-next, where it applies cleanly
 2. send a modified patch for drm-misc-fixes, to fix ASAP the master branch

Would you send the patch as in item 2, so it can be applied to
drm-misc-fixes and have master fixed ASAP? Note iit should not mention [2]
in the Fixes: tag because [2] is not yet on master. I can send it of course
but you can test on hardware so that would be the best option (and I'm a
bit overloaded at the moment).

[0] https://drm.pages.freedesktop.org/maintainer-tools/committer/committer-=
drm-misc.html
[1] commit 99764593528f ("drm/bridge: imx8qxp-pixel-combiner: convert to de=
vm_drm_bridge_alloc() API")
[2] commit ae754f049ce1 ("drm/bridge: imx8qxp-pixel-combiner: get/put the n=
ext bridge")

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
