Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AC43E5EC3
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 08:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785141926; cv=none; b=s105bnauvh40Ze8/CuUCESNSsspwmh0JE7c30bsIbg9khbOenxtLy6V6+e/EdEeQR3CVPHG6LQfziNXXqM31nTeVDkjcdEALEv0ldT7hT1CzumuyyUlJlaLlcFZYqySfyJbl6m4ixbHLUQ0xqlsw2K3LUjK22j1Vx9xsnbqdQQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785141926; c=relaxed/simple;
	bh=tfiikxbpEsntnXsRIbfP6OcnD1+V3RgumXOEyNV27kQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fsvQ/F5s7xuqpZYtU1xcpZsbnn8w8qEw6a08Tpvk7jMcdPD4f6xbtalod2MkRKjJe1CKkZqciOJw6GLasUouxQboNFtZZfqfhhgxv9L7TLYgddTRkR/sfgT35Bj9RbREhV4dCSOkoq+SRTGuz9YKbpEqOtEOprbDaOqElqTkUX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fGi/zEwL; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fGi/zEwL"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f7872abb6so1331229f8f.3
        for <imx@lists.linux.dev>; Mon, 27 Jul 2026 01:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785141923; x=1785746723; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=879jIPCYb5W8l5rBfBUn/ihr+BRPaeGUdfS2I+YUk4A=;
        b=fGi/zEwLhCEj1RLUBVeVpHHeTKOx3Mcc8KjQ80D+lkUr/uZ3pG6VxCgWqh/5/q8R/L
         213W2/e0Um+1NS7j1QCwTarYvqNq19O3se88zSV+bb/21Q2dJ2KylGfFl6F56VXGSddp
         mkYMd98Kr9sRaHumJ04lC4JFTxOwWTukDWneuOx1nCh+ZBMd0vOZ8Yikf/O9SYBZtCX4
         +HD2V1iwq0USROMq6kXpSVSJJmwU2RCwXOZuo2twRrJLg/TKkSLvKM4u8+KdF50pycsR
         1EnaB2AyU3Xn3EBBPZDwIvLQ2NMnPHOWnn/K7BfycuUFT6tNGlgNSohDqOfkmVeNxb+7
         ooig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785141923; x=1785746723;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=879jIPCYb5W8l5rBfBUn/ihr+BRPaeGUdfS2I+YUk4A=;
        b=Y0g6tsN8S5A/DQ0nIkkmTvOpMrIpB42iKr45sutQdRWpOLTa2qLZ8ogR9hKglkUQWZ
         GL5BizrKilg0AJSQfhCipOBATRQruxoSNKsib8qIfYlVTf/KbuSeuCSTFukpD7GaQ3/G
         LbKXEKXVDQuwvnw3DdhCyWh4ri2yv5x1fgIK5tJgIMamQwbVubCc+P8kFp7Fj8ZwrF1b
         9ReTrgSRCKk3wGRIdtrTNuaXWgefh2IK+rviOpo3PUpFF06oKRRX3iOCQ1VICiyK4IiM
         Io6YNciVh5aXOToggFm3wxFAfv81TCqSxhDuEvCkjXjMnmPOeViLai9C6oElm7rDyz0C
         vRrQ==
X-Forwarded-Encrypted: i=1; AHgh+RpmdH8Nx1DtZDHdHWC0U4SllY8qwHvYGdnvoKd9JE9EGR5BvdEds3zWksPmqXzdk9YiizM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzWbKEMy73S8bKafTJuJDOliEPYycbxbE9BxQyPbmtKlRER8psM
	jOGUTw5QTjJv1obuOJkUEPbQWE5DjMy//pXp6vbEsmLasz5mu132smyGK08rmA==
X-Gm-Gg: AR+sD138Vp5rptYsER35mjelEJDA2id9hVB8WxnD3BlHhCBMn2cV3bePFLyQAaS0P2e
	fZxW+0GFWyoC7BeeMrOikXF+YZucXUh2xGHBTzlbgM3JJXFM3CRu5ZcYmpf/4WhCy+71iyGA+1r
	suejMSOXLRCRt/ua1NxSamCWYBCFKUGcXk10ZbVydOmnhRxQRZDTDyqpP9Bqg24Saf40ARQI5p3
	L2vUVeQ2AM4xic9AGBxnRkUhQmW9YZ8EiTEeSD7ACP+SeZoYl/1BIyG1d6jhpzoR0SAZWHW5nqS
	2eFxK7MFVvUP0SozboZI508ioqfH9bqJ6t01v6OBBdKXA3reg0KBRorNSOL7hyQBBfnRMfdmU4b
	KvIq8BRsaNRbS6yX4QHbMETYpnvWyk4u18T9xXiAW1dCDjfGPwAHG/A2Oxd8vZbElO/iKiPGuox
	9AgKpS9b+XfGDwwJXFYwIG/aYdqyrA7nebdT3hkrvcw33rfqwOkq3znZ/C47BkRws6hZxNbCYbl
	sy+Uw==
X-Received: by 2002:a05:6000:98d:b0:47f:837a:aa1b with SMTP id ffacd0b85a97d-47f9fe9300dmr9065641f8f.36.1785141922991;
        Mon, 27 Jul 2026 01:45:22 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63678sm44117738f8f.29.2026.07.27.01.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 01:45:22 -0700 (PDT)
Date: Mon, 27 Jul 2026 10:45:21 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, 
	imx@lists.linux.dev, conor+dt@kernel.org
Subject: Re: [PATCH v2 6/7] arm64: dts: freescale: imx8mm-verdin: Add
 Cortex-M4F remoteproc
Message-ID: <fyoefmlhxpaqh3k5nv4zvna5usjvmdrd7e3hhtygvbkvmegxds@kgmwwh7ifcoc>
References: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
 <20260724-v1-verdin-imx8mm-dtbos-v2-6-9d7988bd76f6@toradex.com>
 <20260724164132.7527D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260724164132.7527D1F000E9@smtp.kernel.org>

On Fri, Jul 24, 2026 at 04:41:32PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Unconditional enablement of the Cortex-M4 co-processor and its memory reservations in a base SoM device tree file.
> --
> 
> --- Patch [6]: [PATCH v2 6/7] arm64: dts: freescale: imx8mm-verdin: Add Cortex-M4F remoteproc ---
> commit 5627e466b821e2ae1d5d44438ab0c467605d30f9
> Author: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> 
> arm64: dts: freescale: imx8mm-verdin: Add Cortex-M4F remoteproc
> 
> This patch describes the Cortex-M4F remote processor available on the
> Verdin iMX8M Mini SoM.
> 
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > index 5fc177f589cb2..ac450fc6cbfb3 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > @@ -52,6 +52,18 @@ hdmi_connector: hdmi-connector {
> >  		status = "disabled";
> >  	};
> >  
> > +	imx8mm-cm4 {
> > +		compatible = "fsl,imx8mm-cm4";
> > +		clocks = <&clk IMX8MM_CLK_M4_DIV>;
> 
> [Severity: Medium]
> Should this node default to disabled?
> 
> Because it is added unconditionally to the base SoM dtsi, it defaults
> to "okay". This causes the imx_rproc driver to bind and call
> devm_clk_get_enabled() during probe, which keeps the IMX8MM_CLK_M4_DIV
> clock permanently running even if the M4 firmware is never booted.
> 

This is true and intentional from our side. The SoM DTSI now describes
the hardware including the M4 for the common use cases, instead of
requiring users to enable it specifically in an overlay. The drawback
mentioned here is a small tradeoff we considered.

> > +		mbox-names = "tx", "rx", "rxdb";
> > +		mboxes = <&mu 0 1
> > +			  &mu 1 1
> > +			  &mu 3 1>;
> > +		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
> > +				<&rsc_table>;
> > +		syscon = <&src>;
> > +	};
> > +
> 
> [ ... ]
> 
> > @@ -164,6 +176,27 @@ reserved-memory {
> >  
> >  		/* Use the kernel configuration settings instead */
> >  		/delete-node/ linux,cma;
> > +
> > +		vdev0vring0: vdev0vring0@55000000 {
> > +			reg = <0 0x55000000 0 0x8000>;
> > +			no-map;
> > +		};
> > +
> > +		vdev0vring1: vdev0vring1@55008000 {
> > +			reg = <0 0x55008000 0 0x8000>;
> > +			no-map;
> > +		};
> > +
> > +		rsc_table: rsc-table@550ff000 {
> > +			reg = <0 0x550ff000 0 0x1000>;
> > +			no-map;
> > +		};
> > +
> > +		vdev0buffer: vdev0buffer@55400000 {
> > +			compatible = "shared-dma-pool";
> > +			reg = <0 0x55400000 0 0x100000>;
> > +			no-map;
> > +		};
> 
> [Severity: Medium]
> Are we sure we want to unconditionally reserve these memory regions for
> all boards using this base SoM?
> 
> Because of the no-map properties, this removes roughly 1.1MB of RAM
> from the kernel's linear mapping permanently across all Verdin i.MX8MM
> boards, even when the M4 coprocessor is not used.
> 

Yes. We lose only a small amount of RAM, in a region that is fine for
all our Verdin iMX8MM SoMs. The DTSI is now set up to use the M4
copressor by default, in line with our other SoMs.

> >  	};
> >  };
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com?part=6
