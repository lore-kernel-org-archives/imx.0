Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6659439B493
	for <imx@lists.linux.dev>; Thu, 21 May 2026 10:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779358726; cv=none; b=qISUyDpyYhWf8qv7JOuUVDX/jcSVH8M72z395rfzyZXVzoPm2q887f/NoFAkRmrVyDjrSatQFTJSW9bpGDIqlXAwLkHzMpg62bg/N/UpUr8xeJkoZNhSznl6gv4nVxSvwf3BJjZEjpYPNPDra6d4yYA9WPRP3mr0hFFTx4ZCk/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779358726; c=relaxed/simple;
	bh=2bYB1xx2/Hr8LzyFvSIy2n94i1GOiw43zEZhsMOD62E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/+r5alshEkcxYK8chQeZ3cp2htsJSpdBsmEd+BMAXdohcJADX52qI5DxCSB+LMHzfMvDLrhQcq1Grx1/hfSLeq5e/fzeeE6EfhJ0CuTMNCxp51uY8sRqPOPiZBrOkYWdwk30yFM72QlQ1roy0T6v3qTs8GLoclIhGr1lQH6dU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JN1dxdeX; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JN1dxdeX"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-44ccbd3290aso5514674f8f.2
        for <imx@lists.linux.dev>; Thu, 21 May 2026 03:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779358723; x=1779963523; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a+yLXkw2GT7LxR1Ajc513/uXxkuEC8xR05slvUKTHbU=;
        b=JN1dxdeX3D/dIaUMSbp2wrHw18IltzOTHWotPIyQcK4/6EtaDxE0pXznOdRZ/w8LOX
         IMDsAORhVfpz+IjD6869UhxGQZBFYGW85WObWyMNVPEPwixgpP+XA8F2+hphLdHHhtN7
         J7iTbSWDCS3BuINXVYaCuuaoa3KBMU7fB1yHXpfcNOFVXNRGkGOr92R1eQJ/SOagAtgU
         vsKXM3L4tmnua5/m32kAyYVc0HBaPYUoYzn7f2T7mbiNLn5MsP/4O47TW/bTAieHPRVS
         T8Sv0bTnlzfAhl1XYJhKXssPB39RuovHtzemIArPQUgqmTikUU5WjFP1lHVv/mlmUzP4
         2W5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779358723; x=1779963523;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a+yLXkw2GT7LxR1Ajc513/uXxkuEC8xR05slvUKTHbU=;
        b=KpRiuMDjfiLA08yjJl8j3w5ghGrHMuvqnz4287NrufF7jUoIcut9KzkPJLunAxH/IL
         qlrWsEzA+YKCYm8Hst/DLM5X8SYReM7UMUDcvlhNbWhRZY8hhEt+FKclFxmZPhcs8AFL
         cXvfSrRhc5WKmy0TNkia3+JvpD2WQ5gG6tcoNgIizliFLbZEOK/fVTv5SlAyIpBugwQY
         vmfOphkEbNWI9QbWMi8+lv8NfGqAruEYb6ZN0cTy9sSJfka5IZ5PfypS5iDhS3mE/bNd
         U/L9+3ubWeH4p+u9YDAVJSys6cuGe/u5y2OFZotVhSmCNNtx8qg37L6dNDOX/qP2BAzQ
         TR/Q==
X-Forwarded-Encrypted: i=1; AFNElJ+mzonWcVzGt7ba9wf42GR6kYcgFnwH7hNx+F/n7PfIq3t/+ll5ndc/tmzPl/IohEwD5sg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdT+JLh4SdTqYtv/Eig8b6ulJp4wsEckGXaW2QYy9kIZk9r5py
	l3+KBRx/ajnCHVBIGnuonrjpdTm0yLQKUGSFDiNTxcdau8Omi0dczDeHy6TNdFD2
X-Gm-Gg: Acq92OHyn5F8ByEdpHLqf4H135ump00pGCkqsPXzojf6oK+H2KuNWLxibtyb/ipyWhl
	hJ61Y7DB09xcIQrG+eTYLlrtZ9Et3tXftQRpFPh9Tj/6CrTSBhjs2dBoMhuS6hvYoqJu2Ux+QRI
	qCJEN8ar6o0XRQUIm1+DRAIttwWahDI5/0bPMpFT1HS1pJbnADYtJJbMDE1iYUSWphJ/YLZytZ1
	X4wtOtYH4ZftU9AXMrkchUdFmpyurmDYMfFkVMiWjZGHdN/GpIat+Db2PY8TKqKUauJF14/jHMu
	iVKPXcKEXsLalRMKvIR0wl2Jy28sX04BidfyuQ3svjpKIZwRyh/xXk7tmKoujjzuxKbmGMDS1gZ
	cmelvWfpH7lDZ1kPyhnu3Lg5h/QRmXoCVAfGrGEYStLRsSCHxIJ/cLUWsWb34dqkrvvhhVXJGGB
	QopyGIMCXyBKSKDcZj2ut7xwfN2g12LehgbMGD4eEwDVh3R+6xSlI2puAD6e9TmC9oYxCrzht7m
	rC18bfXw9rzqWURPbV8jb9NRlJJ7Yd6FiwbjMo5Q9kVg5rODuZSXrlEqq4uV2cDTFMsOXGeGYSN
	plgAScUuMQ==
X-Received: by 2002:a05:6000:4284:b0:43d:dd:8ca4 with SMTP id ffacd0b85a97d-45ea36b88ebmr3980111f8f.14.1779358722497;
        Thu, 21 May 2026 03:18:42 -0700 (PDT)
Received: from franzs-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7d9daasm1980702f8f.11.2026.05.21.03.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 03:18:42 -0700 (PDT)
Date: Thu, 21 May 2026 12:18:41 +0200
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Frank.Li@nxp.com, sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, 
	conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: freescale: add Aquila iMX95 support
Message-ID: <3pcmepn2kr2b2gku33mriosmnim4xd7e75pt2j7i7vnt4awhgg@3cptbxl5u4x5>
References: <20260521-add-aquila-imx95-v3-2-621843807def@toradex.com>
 <20260521093854.14DAB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521093854.14DAB1F000E9@smtp.kernel.org>

> > diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
> > new file mode 100644
> > index 0000000000000..bb4a3631af9ba
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
> 
> [ ... ]
> 
> > +/* Aquila I2S_1 */
> > +&sai2 {
> > +	status = "okay";
> > +};
> > +
> > +&som_dsi2dp_bridge {
> > +	status = "okay";
> > +};
> 
> [Severity: Medium]
> Will this bridge fail to probe since the DSI input connection is missing?
> 
> Looking at the ti-sn65dsi86 driver in ti_sn_bridge_parse_dsi_host(), it uses
> of_graph_get_remote_node(np, 0, 0) and unconditionally returns -ENODEV if the
> remote node is missing.
> 
> Since the upstream i.MX95 SoC DSI controller doesn't appear to be implemented
> and linked to the dsi2dp_in endpoint yet, should this node remain disabled
> until the controller is available?
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260521-add-aquila-imx95-v3-0-621843807def@toradex.com?part=2

Hi Frank,

This is valid point from the bot.
If there is nothing else, I'll send a v4 that removes '&som_dsi2dp_bridge' 
from the Dev and Clover board, since the node is disabled in the SoM dtsi.

Thanks,

Franz


