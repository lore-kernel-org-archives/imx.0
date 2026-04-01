Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 767DE36DA04
	for <imx@lists.linux.dev>; Wed,  1 Apr 2026 15:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775057237; cv=none; b=JP3vJb9ua/oLiaI+UQde87vEdWl9sHB/6wu05HvkMgCE8h5iG8tfgx2Z0fEF9/koSJS5k3SXHtlJRWkbZcPbWzLOuTy4ssI3Ag9oEyuBRj1LwIRBpDJAoqUopIgKTCQyDIgNg1dXTIEQOmFhNg1tsE8wNKGV+wmWWkQvtL60ABo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775057237; c=relaxed/simple;
	bh=y+MhPjsu8qOsmSPWBWTYc0aedsaAPB/kfVjv0IQGfi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c/BVnk8pzLSQcHml31mgWurThZ1wXs5iEpcUqQI0dBR+z1z2mJjVmBlMdJZkFccitK8DV8v3hnMq/Q3tkxveUE3ZUaU2U/UkYUJ/DNgAefBAlSJ/De1uoRQE/v3rpRIKEYYib7IYtvmEPPcSa+/PtQVfE2PHTP6KnwnoigO/RZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OGyhO/oO; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OGyhO/oO"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30A9B1F91
	for <imx@lists.linux.dev>; Wed,  1 Apr 2026 08:27:09 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BF3573F641
	for <imx@lists.linux.dev>; Wed,  1 Apr 2026 08:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775057235; bh=y+MhPjsu8qOsmSPWBWTYc0aedsaAPB/kfVjv0IQGfi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OGyhO/oO0iERleaU2j+e75sT1FsSDCwj/O+ilQz+VlIo+uVpHxECJICJQo/OZ+hSy
	 7jv1TedsSlf9SyXvS0lRHB/bxvTay6OK0yIKuiIkgoz81YLqvcCv+I7JG9D2Xosqa2
	 PQTPaiMfJNFz2qwQRzARCRjC63HIhlqarfe+mb8I=
Date: Wed, 1 Apr 2026 16:26:50 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Guangliu Ding <guangliu.ding@nxp.com>
Cc: "Daniel Baluta (OSS)" <daniel.baluta@oss.nxp.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Jiyu Yang <jiyu.yang@nxp.com>
Subject: Re: Re: Re: [PATCH 1/2] dt-bindings: gpu: mali-valhall-csf: Document
 i.MX952 support
Message-ID: <ac05OpEMjKMd8CXy@e142607>
References: <20260331-master-v1-0-65c8e318d462@nxp.com>
 <20260331-master-v1-1-65c8e318d462@nxp.com>
 <acva1Xt8V4k9-uG8@e142607>
 <AM0PR04MB47073E9E8B5C704BCF5D9F72F350A@AM0PR04MB4707.eurprd04.prod.outlook.com>
 <99a1da55-d6e5-4d11-abaa-8c85283ab5f2@oss.nxp.com>
 <AM0PR04MB4707B3E37DFE7AEE587DBA2AF350A@AM0PR04MB4707.eurprd04.prod.outlook.com>
 <aczv0R0aQRmHKdvt@e142607>
 <AM0PR04MB4707335CC7035232D44E6ED9F350A@AM0PR04MB4707.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM0PR04MB4707335CC7035232D44E6ED9F350A@AM0PR04MB4707.eurprd04.prod.outlook.com>

On Wed, Apr 01, 2026 at 10:31:01AM +0000, Guangliu Ding wrote:
> Hi Liviu
> 
> > On Wed, Apr 01, 2026 at 09:43:12AM +0000, Guangliu Ding wrote:
> > > Hi Daniel
> > >
> > > > On 4/1/26 11:48, Guangliu Ding wrote:
> > > > > [You don't often get email from guangliu.ding@nxp.com. Learn why
> > > > > this is important at https://aka.ms/LearnAboutSenderIdentification
> > > > > ]
> > > > >
> > > > > Hi Liviu
> > > > >
> > > > > Thanks for your review. Please refer to my comments below:
> > > > >
> > > > >> On Tue, Mar 31, 2026 at 06:12:38PM +0800, Guangliu Ding wrote:
> > > > >>> Add compatible string of Mali G310 GPU on i.MX952 board.
> > > > >>>
> > > > >>> Signed-off-by: Guangliu Ding <guangliu.ding@nxp.com>
> > > > >>> Reviewed-by: Jiyu Yang <jiyu.yang@nxp.com>
> > > > >>> ---
> > > > >>>  Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > > > >>> | 1
> > > > >>> +
> > > > >>>  1 file changed, 1 insertion(+)
> > > > >>>
> > > > >>> diff --git
> > > > >>> a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yam
> > > > >>> l
> > > > >> b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > > > >>> index 8eccd4338a2b..6a10843a26e2 100644
> > > > >>> ---
> > > > >>> a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yam
> > > > >>> l
> > > > >>> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf
> > > > >>> +++ .yam
> > > > >>> +++ l
> > > > >>> @@ -20,6 +20,7 @@ properties:
> > > > >>>            - enum:
> > > > >>>                - mediatek,mt8196-mali
> > > > >>>                - nxp,imx95-mali            # G310
> > > > >>> +              - nxp,imx952-mali           # G310
> > > > >> Can you explain why this is needed? Can it not be covered by the
> > > > >> existing compatible?
> > > > > There are functional differences in GPU module (GPUMIX) between
> > > > > i.MX95 and i.MX952. So they cannot be fully covered by a single existing
> > compatible.
> > > > > On i.MX952, The GPU clock is controlled by hardware GPU auto
> > > > > clock-gating mechanism, while the GPU clock is managed explicitly
> > > > > by the
> > > > driver on i.MX95.
> > > > > Because of these behavioral differences, separate compatible
> > > > > strings "nxp,imx95-mali" and "nxp,imx952-mali" are needed to allow
> > > > > the driver to handle the two variants independently and to keep
> > > > > room for future
> > > > divergence.
> > > >
> > > >
> > > > This information should be added in the commit message explaining
> > > > why
> > > >
> > > > the change is needed.
> > > >
> > > >
> > > > But then where is the driver code taking care of these diferences?
> > > >
> > >
> > > Yes. Currently the driver does not require "nxp,imx952-mali" string.
> > > However, when GPU ipa_counters are enabled to calculate the GPU
> > > busy_time/idle_time for GPU DVFS feature, they will conflict with the
> > > hardware GPU auto clock‑gating mechanism, causing GPU clock to remain
> > always on.
> > > In such cases, ipa_counters need to be disabled so that the GPU auto
> > > clock‑gating mechanism can operate normally, using "nxp,imx952-mali"
> > string.
> > 
> > OK, I understand that you're following guidance from some other senior
> > people on how to upstream patches so you've tried to create the smallest
> > patchset to ensure that it gets reviewed and accepted, but in this case we need
> > to see the other patches as well to decide if your approach is the right one and
> > we do need a separate compatible string.
> > 
> > If enabling GPU ipa_counters causes the clocks to get stuck active, that feels
> > like a hardware bug, so figuring out how to handle that is more important than
> > adding a compatible string.
> > 
> > Either add the patch(es) that use the compatible to this series in v2, or put a
> > comment in the commit message on where we can see the driver changes.
> > 
> 
> According to discussions with the GPU vendor, this is a hardware limitation 
> of Mali-G310 rather than a hardware bug, and it has been addressed in newer
> Mali GPU families.

I represent the said GPU vendor and I think I know what you're talking about, but you're
taking the wrong approach. All G310s have a problem where in order to enable access to
the ipa_counters the automatic clock gating gets disabled. So the solution that needs
to be implemented when we add support for IPA_COUNTERs will apply to all GPUs, not just
MX952.

> 
> In addition, ipa_counters are not enabled in the current Panthor driver. We observed
> this issue with the private Mali DDK where ipa_counters were enabled.
> Therefore, keeping the compatible string is necessary to allow for future divergence.

This is not an MX952 issue only. You might be aware of it on your SoC, but it's not just
for it.

Best regards,
Liviu

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
