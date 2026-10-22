Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792689859;
	b=Ir9nxAUCljq/oSVGD3p1dcMrzYoWdNWeQiD93Vmwv3HsOO2a8x+OXwhSJPFv+6eKFvzQ
	 kT+xRwTH0bSrHcYZcElakGrsFu7YhwklaTeJDMRM2W1fHvvhOA9WXRzRDrOLUEZJTjMNF
	 lMShrb42lJetuz8eSO02RqbzJzwSvnLXumtRn9b/9lvQopgJ8gbdaopd4YK+BY5X55kR1
	 0A2rl0xp4vMGW7012ge2nVM3iw1jF3bQZkbjKrnWRef95ZX5NIcN+0dt/R5+NKPPYhoAR
	 lNg0wiu6fk3Hu0y9L3OTySw8VnBFZ+1lLTq0WJQ6IzFdmmOUERPXItYbmOHUlznPs+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792689859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hBV+nz9NxiWTPP78jPpMIYI0V58VBFwRxWz2e7M7Hh8=;
	b=vwa9SxaVX/u4LMxX3HxmSg1IfTZvOzx5PDtM16vl6NOk0Bk2LM59kPuwzabC0dHQC4gf
	 u7dlgvQdnzoThLE5IgZr1Mf+Pw8XLBGdVGao32KEUPKodkw1Z+JdNJUHzlt9+xfT751P9
	 FarIeDIO+Ga/8bxJOis30YNZlk+zvHRImCVIkdbkMITMof4+ZRffHMWAHCktGVOxt9zBe
	 Onh3KUiSFcMru2kr/QtryumNprTgx7YSu2bsorBexTDYj+YnkQZJ4GpFkjMvfDBhuywz5
	 MQJSXQAiUCeO9d4q5r4ugMGViydklB5cICrJ8A8jd3qYlvm2yYhoHeL+DcRJFa/+JVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NTInnhpA;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5497C606A31D
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 17:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5497C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NTInnhpA
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so50726a91.1
        for <imx@lists.linux.dev>; Thu, 22 Oct 2026 10:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792689859; x=1793294659; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hBV+nz9NxiWTPP78jPpMIYI0V58VBFwRxWz2e7M7Hh8=;
        b=NTInnhpAtySzGJ4Uh93zgLc+G4b0osRRGm8lZO3GKDMgpJSQitgfQtamnaZyUqV317
         Ol4iDPD/HkzUF3yk7ryOa6EUNx7h+QFbSJn1KSUEtkgSEUM4yOD4I8CVsoyKyPi6WtC5
         U0vqtfMrGT7uhobDp8UiV7lAjDvPp9AJ5SICUUAt43i9VrAKN6LPadY6d8bwf210tx1z
         u5ACL8FP7Fgp/3Zb0YQfvqhMhA212wbMlyCZqAewY+iWy6a09Es+CERNzDuT+Salxd1+
         JLd/uZe/tPwewIRdgb3IzkR7sxI7OBh9vzPqtik52hAeAu1AqS95qbu7/5/jriAildxq
         OGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689859; x=1793294659;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBV+nz9NxiWTPP78jPpMIYI0V58VBFwRxWz2e7M7Hh8=;
        b=oKybBFu3ipU737tZqd6/1k9LtJkCwI4kmjNNlSiqIdJvourQueksQWQLecVU/frv43
         Ypyj9Cbwb/VuI5FTkUdMw2RM38lGYEOyhUAZ1ADWquMFSxlzVnY2XxfbVBXmZeZeUMV8
         2SGRLruRaeO0hD6R0PtGhMmiKZjamD/SX15JHoZq2ro1bQb0pRCs2Cx6NsBvaWOLSCaF
         IIdlJ/obJB2XtqGDOCxpe7PvFjYEC/uWcRPa7/P3SBl1zywuhmogtjJIBiQ9JOuL7la4
         iykuBLUNjeRYPqTYwmeOZUVVwdPDG3asNqpHUCsjhWz73Nyqar4Lxd/8owvrf0iSkkJV
         uvtw==
X-Forwarded-Encrypted: i=1; AKwUvBzpjYfOQsusOcmPdgtbKxfXn3mWPsGO18DJtGwIuZ/xIJ4aLkbr8zJZplZkidVDfTwDNVw=@lists.linux.dev
X-Gm-Message-State: AFq9FYImP6HFKAI4chKj+DWQlMnNt93KHe4tdOtWJC/TJIOCQVWhoqK0
	XLJu1nZMH7/gKn/6JO7RhqjC3voSm5QXZq55WLk37wfThabOgbeQbGGkzFb/qhnfSXw=
X-Gm-Gg: AYBFou2p50A0iiiGGUZkK8umvXOM9oNSI3GhXr/MmEGLGGuMYTtK8UqZBj7fvTL0gRu
	VJKn0if/y40D7VmP0CHSnYgcharzsFUUhxEN7i7aLShXSN0bOjDKChFJRd063ZO6VEs+IWSkOMZ
	UnruFj084l8DRiRqF04yUal9G/TZ3prYTjC4i41MKGnEGrLLRLbnRGobZzd5RdQ3zKigibfzoQN
	SPgab/6RI0AuasbUNUmvBHbdjts11pNtIOBRXiUp+vSeyk399scxX3zgVSRcLoJ5UYhFMkd7uxh
	PSw4srRs3P89ELxFSuQeQ8U6KIzghpwlXXGREjKIt050jt2uarfQgsFQ99UuJ4EHcUhaXknuiI1
	Xvj6N+rl+RtudkDNHZE7w/DcQ2mlznq+iM8sCeixMOFuNTtCT9FB8Xb6NUbwxhvROyyOp2XBbz6
	w545FRU3sEfyu++jJKM7GS2yviduJElg89ARiHSIlbdo/o2XmzjZuqfW3ZJ8dORRELs675NJ1A/
	snIQhfHzWZJfaz7zfJknMGWK1HDoc5FkbKnmGJPBbPAKAZkzFCK4FTEIkc=
X-Received: by 2002:a17:90b:580c:b0:3ac:8ee5:e00f with SMTP id 98e67ed59e1d1-3ad86cc1a23mr4599427a91.57.1792689858509;
        Thu, 22 Oct 2026 10:24:18 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9e85:9169:41c7:bc2d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada490e5f8sm5060365a91.9.2026.10.22.10.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:24:18 -0700 (PDT)
Date: Thu, 22 Oct 2026 11:24:15 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Frank.Li@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v7 3/3] arm64: dts: freescale: add DT overlay for
 MX95-15x15-FRDM RPMSG usage
Message-ID: <atpGv_FiRlgPh4-4@p14s>
References: <20261020-memory-region-name-v7-0-1413d5928340@nxp.com>
 <20261020-memory-region-name-v7-3-1413d5928340@nxp.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-memory-region-name-v7-3-1413d5928340@nxp.com>

On Tue, Oct 20, 2026 at 12:50:23PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Move related memory region to overlay files.
> 
> Add RPMSG DT overlay for the MX95-15x15-FRDM board. This overlay is meant
> to be used with the mx95evkrpmsg system manager configuration for
> remoteproc and audio over rpmsg-usecases.
> 
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |  3 +
>  .../boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 81 ++++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts | 31 ---------

I will need an R-b from Sascha to merge the above files, otherwise they will
have to be resent separately.

Thanks,
Mathieu

>  3 files changed, 84 insertions(+), 31 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index a80cccf34eb56..f3b19f3b1488e 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -960,6 +960,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx943-evk-mqs.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-ab2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm-rpmsg.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
> @@ -984,6 +985,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
>  
> +imx95-15x15-frdm-rpmsg-dtbs = imx95-15x15-frdm.dtb imx95-15x15-frdm-rpmsg.dtbo
> +
>  imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
>  
> diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
> new file mode 100644
> index 0000000000000..c3deb277edabf
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
> @@ -0,0 +1,81 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 NXP
> + *
> + * This DT overlay is meant to be used alongside the mx95evkrpmsg SM
> + * configuration for remoteproc and audio over rpmsg.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	remoteproc-cm7 {
> +		compatible = "fsl,imx95-cm7";
> +		mboxes = <&mu7 0 1>, <&mu7 1 1>, <&mu7 3 1>;
> +		mbox-names = "tx", "rx", "rxdb";
> +		memory-region = <&vdev0buffer>,
> +				<&vdev0vring0>, <&vdev0vring1>,
> +				<&vdev1vring0>, <&vdev1vring1>,
> +				<&rsc_table>;
> +		memory-region-names = "vdev0buffer",
> +				      "vdev0vring0", "vdev0vring1",
> +				      "vdev1vring0", "vdev1vring1",
> +				      "rsc-table";
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +
> +		vdev0vring0: memory@88000000 {
> +			reg = <0 0x88000000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev0vring1: memory@88008000 {
> +			reg = <0 0x88008000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev1vring0: memory@88010000 {
> +			reg = <0 0x88010000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev1vring1: memory@88018000 {
> +			reg = <0 0x88018000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev0buffer: memory@88020000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x88020000 0 0x100000>;
> +			no-map;
> +		};
> +
> +		rsc_table: memory@88220000 {
> +			reg = <0 0x88220000 0 0x1000>;
> +			no-map;
> +		};
> +	};
> +
> +	sound-micfil {
> +		status = "disabled";
> +	};
> +};
> +
> +&edma1 {
> +	/* reserved for M7 */
> +	dma-channel-mask = <0x40>;
> +};
> +
> +&edma2 {
> +	/* reserved for M7 and V2X */
> +	dma-channel-mask = <0xf>;
> +};
> +
> +&micfil {
> +	/* reserved for M7 */
> +	status = "reserved";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> index f82e149323d34..3ab679e5a4740 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> @@ -189,37 +189,6 @@ linux_cma: linux,cma {
>  			linux,cma-default;
>  		};
>  
> -		vdev0vring0: vdev0vring0@88000000 {
> -			reg = <0 0x88000000 0 0x8000>;
> -			no-map;
> -		};
> -
> -		vdev0vring1: vdev0vring1@88008000 {
> -			reg = <0 0x88008000 0 0x8000>;
> -			no-map;
> -		};
> -
> -		vdev1vring0: vdev1vring0@88010000 {
> -			reg = <0 0x88010000 0 0x8000>;
> -			no-map;
> -		};
> -
> -		vdev1vring1: vdev1vring1@88018000 {
> -			reg = <0 0x88018000 0 0x8000>;
> -			no-map;
> -		};
> -
> -		vdev0buffer: vdev0buffer@88020000 {
> -			compatible = "shared-dma-pool";
> -			reg = <0 0x88020000 0 0x100000>;
> -			no-map;
> -		};
> -
> -		rsc_table: rsc-table@88220000 {
> -			reg = <0 0x88220000 0 0x1000>;
> -			no-map;
> -		};
> -
>  		vpu_boot: memory@a0000000 {
>  			reg = <0 0xa0000000 0 0x100000>;
>  			no-map;
> 
> -- 
> 2.43.0
> 
