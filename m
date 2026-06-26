Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6853F6619
	for <imx@lists.linux.dev>; Fri, 26 Jun 2026 13:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782480105; cv=none; b=Lk1AzcEeculsLtxMM6h3yfpbO+rQ6uhgAjZlLE60Uag+8MgL+F9nquyfdOpvfyIG/VmHZ/oG0n8Cu1m85V8cCJV9asm4GvW2NMhtR1g6EEpM84fKKdnlGEJq/eFsE6hPL+GxA1WAZTpUj0VQY/3mGykz+FE1Xwjc+ZEGd/ol1Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782480105; c=relaxed/simple;
	bh=pDPGZpvd3IfjOFyuEjSQA4JA6xmoXsUV/fcdGa6NUG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l3Ss8Z5j3CUzYmGDOd5qshIfUXKZ555UGK3lsf+Ufw6DnnIxrlnHPXdayRXRNr3zGGU20jT3PKwPmlVTI2vFot8Ct42FWvxFyLRbxXoRke5vctx7ZdFw1ApazAHdo/4T5vadCWRTvy1vFMRx3ErxeszmmOv74f8NRMVYqrgBKXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y7vaJIB3; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y7vaJIB3"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39ad8dbe947so388511fa.3
        for <imx@lists.linux.dev>; Fri, 26 Jun 2026 06:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782480099; x=1783084899; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QIA0G/jpdUonaNek+iyuSn4PC2pWxZGQ0umU16wcyA4=;
        b=Y7vaJIB3YFD4TWivZ5Hi+ycYdGEz4yAkgeAWaJD1++ZT3/I9zwy3bRp/jD/agg/kdD
         uK5wRgQufuryiUiVXXdF2ceGbrUzua0XZWcUn/H/mRTQRysPaYS+QDQu3aKGBY76XyKw
         PKbMZDNN9ehW97z7OdLOFRzltaJJCLHe6PgO9LyfWihsxwUzf+O8V5DSWEWoMEQMbyvZ
         velBKmzVi0nfY1gCjBJgEyJH+gBQbGKk4+yaCVrzYBaFuoSngBNGr9d+IlXK4JGCgDA7
         GKYXYMU9BwiclM5CU3Ni4Gcb2h/ldj414Zu2Nyh+IFCvTUkErBWdKQsmUQuk/dE6XlfK
         XnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782480099; x=1783084899;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QIA0G/jpdUonaNek+iyuSn4PC2pWxZGQ0umU16wcyA4=;
        b=QWmdeV9aAoU03y+fK6Zwew8FlzrcsMnSnNNrlNI/f3SeDA1SVvBJYgqhT+umIUlRFl
         qZEHRMgUcUeASLsBvU2REkeAcjDH7vhFRs1QO5WMoDPsB3JC9Z+4ST0GCfct0+I6MaLz
         w4ti0aJa7Lga65h7xnfCY/CLdNgIfh8rNgxvPtxl6b9EeuFxO4F/Q87wrXCfeUbhVukw
         mGw/aeOFsKx0KkNohWDBOUU/2v4LF3geMRHn0fjFOV0bXPST0fyqTq9nSxzWg4VWRo3/
         kaDjjbSzI39W75wEzPjV6kpCTz3S+Yg0I2iqEl1LJNvSSIC0v2eniiHIvKEo0Yr55A4+
         z5Iw==
X-Forwarded-Encrypted: i=1; AHgh+RoFWhAeNM9l+KSOjvBFjRrTHUtlVZ6IV22TgPMBG4dzohu5KazKjNPPkYWEjk/0RM7Ntow=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzo4OqPTaprBNI7fUI8kTeMBFZjFIQWNuR2wvwCB+vhUbI+1x3d
	f64rCJOBMeTmwlgeADL0rL1kdWA4kxbyQdR1afV4WB/TXQmPuUJBL6ZtgbsTuh8P4bw=
X-Gm-Gg: AfdE7cmz5da/tDVuneheOvS/SM6FcSPN140YpGOim110hg36mX5o4he8o+QI2GzKz23
	YX9IsBW1BFwpwIDg+iJuVPHODXHw65YagnIxQ9CvJKfdWQdWik+kh/40ZS1N9rYEyi+VaVDnKSi
	mipP/uX5wktaKiYd16P2sfV7qfw+W1AEWt6PBnrWOfmwIKYGK2H3ILSF2k+yW7mZ/WwR554LgZ9
	kCdjhr0smJKYgSY9gwVqWSg16AhpI37Lw4s3px2DvX8lCfLkdEi1gFmsbakQ0zdyF0KLUxB4ELB
	LFuWkgCEjf4aV/+M+jNRggVkdOxffI7li9gKWjcKUMXVAYGlVwuWuanZFH+hhJiP3/QBXr8uRGn
	dV3knD6bE6MVCRAVFotNWhqvEW9tO9U3oJ7Fwl1yRLlKVB0c2WDkCi8wuhdIqNBDMDXe8Es2rIF
	IEB83L/+Q10OOartxByT545fUOaQktJp+T8TDLZFWCwKk0El4cUc7RQrarAQEYnPaUbk4cqRkDe
	PuG6w==
X-Received: by 2002:a05:651c:1511:b0:39a:c9d5:3c65 with SMTP id 38308e7fff4ca-39acb97be3emr7979051fa.8.1782480099479;
        Fri, 26 Jun 2026 06:21:39 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ae2613f76sm460481fa.30.2026.06.26.06.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 06:21:38 -0700 (PDT)
Message-ID: <2f238823-d340-4cad-b6f0-24ff86ff969b@linaro.org>
Date: Fri, 26 Jun 2026 16:21:37 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] media: dt-bindings: video-interface-devices: add
 video-interface-devices.h references
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>,
 Matthias Fend <matthias.fend@emfend.at>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Michael Riesch <michael.riesch@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Martin Kepplinger <martin.kepplinger@puri.sm>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Richard Acayan <mailingradian@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux@ew.tq-group.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
 <20260626-kbingham-orientation-v2-2-47178be927b4@ideasonboard.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260626-kbingham-orientation-v2-2-47178be927b4@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/26/26 15:07, Kieran Bingham wrote:
> Expand the documentation of the video-interface-devices orientation to
> reference the include/dt-bindings/media/video-interface-devices.h header
> which provides human readable defines for the orientation enum, to help
> avoid hardcoding values in dts.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>   .../bindings/media/video-interface-devices.yaml         | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interface-devices.yaml b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> index a81d2a155fe6..c9c3f4f16719 100644
> --- a/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> +++ b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> @@ -392,17 +392,22 @@ properties:
>         The orientation of a device (typically an image sensor or a flash LED)
>         describing its mounting position relative to the usage orientation of the
>         system where the device is installed on.
> +      See include/dt-bindings/media/video-interface-devices.h.
> +
>       $ref: /schemas/types.yaml#/definitions/uint32
>       enum:
> -        # Front. The device is mounted on the front facing side of the system. For
> -        # mobile devices such as smartphones, tablets and laptops the front side
> -        # is the user facing side.
> +        # MEDIA_ORIENTATION_FRONT
> +        # The device is mounted on the front facing side of the system. For
> +        # mobile devices such as smartphones, tablets and laptops the front
> +        # side is the user facing side.
>         - 0
> -        # Back. The device is mounted on the back side of the system, which is
> +        # MEDIA_ORIENTATION_BACK
> +        # The device is mounted on the back side of the system, which is
>           # defined as the opposite side of the front facing one.
>         - 1
> -        # External. The device is not attached directly to the system but is
> -        # attached in a way that allows it to move freely.
> +        # MEDIA_ORIENTATION_EXTERNAL
> +        # The device is not attached directly to the system but is attached in
> +        # a way that allows it to move freely.
>         - 2
>   
>   additionalProperties: true
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
