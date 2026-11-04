Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802436;
	b=SvS4EAW9b3MNJgj79UZf9EYrrhK0PdawN20P51kLCl54nueY7bYWrhlkEzDQhuAtHwBR
	 fLxq1/GZB7LHOPm24pqZ47pRyxQcSt/FyHQN+u7WANCw1pz1rZy8ST6iSdB+Za98hGU1Y
	 HdSZJ+52XVfs/a39qJEkLcmbkNRWBlR3lYS/BRnSeWbo167Ey8yviGdHYhkotyR0tPgpf
	 FRecZTcGfvTiWAn4u1+b4EG+UodijBgSKr3M6d+8sJmhRQr55MaJ0vtTE4n1GXXTO/YI+
	 0fZNDSaeSFgsyO2yJfg3om6CvkiO8/JB548q/XV/A2ULry6EOL5S2gFC7G/FkIGxYxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pPtm0eb9nZ/yd1Ukgq4s2E99XudBd3eQPvzNFyuR60g=;
	b=IgTDmDJzfwEttThhVZEep6xyZUCWyNPjifE3xynbbtfupqGy9ZKUHW6zBT+iIXPw+ei9
	 wjvc0gB8JFqII64Bnlfa5bqAbSMC0Ez34kvGfWrTNB5yOwsPjEHOI1d0qRjSXeiS39VSF
	 UvqLSdr79h5zb2xKJLbTsbm63Kt+tt9DlVS5Td48orODtx6U9zaiaKquuhcb1E6YEtF4U
	 FhGmNTvIrB9VuwYBRPB9r9MvY8n/D4HV0k6b2zotPvml//ZYQDesDbv+8yJyQse+ikqLH
	 WR8LKQ++HCXVnLiWbpl2wXRPpoaDrr1HqbsuCWiCmDsntX4PSZ786tk7zH6g3JvRINA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vJ27kRmm;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A22606A329
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 14:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3A22606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vJ27kRmm
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso530999a12.0
        for <imx@lists.linux.dev>; Wed, 04 Nov 2026 06:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793802435; x=1794407235; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pPtm0eb9nZ/yd1Ukgq4s2E99XudBd3eQPvzNFyuR60g=;
        b=vJ27kRmmMvU3p3SlKn5HFf1p5M+25xixbn11i6Mnh+m3jlB/aAS761QgbamqIMOX1e
         Z9gaesxtbhJ5w+2TMra7cFbSSnWKD1FSDRiVwgU01ZgMVWewbVQExc5gYfGdLo+rTb6A
         FrUrrq3WtTaugQXvX3/O0D/RIVx0xEusMqKK0VQ+IMwT/yu5I+W5b59JEfUKIDyc/HPj
         8PCXsKs4j40syE727YTzkm4H4c6fdmJzb8C3OwqAKCri4ayMou1sjbFuP6qcTHaaC0gp
         uE3DnCz6cR4OkQnPyItCHM5sKt3GFZC/Wn9MKZJc0b/v2opf7VUqAt/0Q2mdIKdwZi/f
         EV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793802435; x=1794407235;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pPtm0eb9nZ/yd1Ukgq4s2E99XudBd3eQPvzNFyuR60g=;
        b=Fsvm/KfY+IfSZJQMhnNxszbqMAUv1NgVGFSLCrbm4ypZTG8ICaV3HuVrmRk3C2epQb
         Sl0qVzuVukVhxwSrxcThZFKPnBJjltoRc5kAHMxD45gJ0zNil6gUYprPDt+E1ZUT4f2Y
         iwTwD9gyzRhN0yedjbIBTRWZkDidaBFHuCoPiKSpefhK9YE8GkXeVDKDl+jMTYBgltKQ
         AVlVnHmQ8kIQ6z5G8SyE24HR4PSth+xAVUiU4Abgo+lmIE7HvdrZV3B3oLNNpYM3hlY6
         kIpdpTHPzrVELGKG15e6Qe0SjaPbnd2/QKntq9J/LiCJgYVLdjmXFyxhgk9AB3kVai3c
         T9HQ==
X-Forwarded-Encrypted: i=1; AKwUvByAhtR29THO+/+3osKdnKzfGXg/vL1QoO59SdW7kkjdI9rsc1hEFcJyT3kfNTqaAyvCz0A=@lists.linux.dev
X-Gm-Message-State: APuU4Z8alWnyo4620htNF+Y3rWXBiFTk3cQoG+YtnOvMuy2UFp0Vj93b
	KSPilYOvlGmhZxGCtMaMgfpxpoIVnbNKEvfRKab6/UY/3fK9s4Fg4y6l
X-Gm-Gg: AYBFou2DhrwA6KARR1SCbx1SmrzNMgAdnvpTp0uMr31uwG01Uj6E6TfHPQoqSCUxaq1
	EoBQfUr9tspbxdkCb6pYkleoGa7OykWECWyggCTTNLqGM0F9wpPYla3uTMSyAEkOK3HepCu+EHc
	z0ZvszVI3YnNz2GCLENiKRhJiacUFKFNYLw5KumN8wuAyEUiQRhX9i9tLNA8Y5Be/xagBkoLR1e
	wTxQ4oE75JLTJH4DBTCUWWIkj5CUCMaD1ZsM91w+bUZt/Ai8PeuCSwxlGhHBZPoSIzPqU6tTh9+
	YH/IfRZB0Y45wjrIrsT9f1DHX4uMDMehtg115jgmu2fWh4YXLf3P/4D6s8bShY8I6xYRHNVQ/m2
	HlVTNxYsGl1l5ntgLHDWm3LtgCmUaXykijaOfwBs35RcgUchO3UELaMZcbEuXyXrlX8nqzfQJlf
	0znicVm4Os6ObtUp+kTEV96X5zq7JdjL5I5lL5wfmw0hQ6t2rZpuc+A9PgPib9LkXntTlpDs3Jy
	u9ONtbBEQcpV1+lnRxblRAc9GJHqx3CxuU3aN/aTA21RX86caXTn/4WU2IswQlOJo1nYoxC7RDp
	Hy+DavrMgn/KMF7M4gJPCx5ZjQBgTZfmuHe3Kx8SlUoR3LZ77mZi6jA=
X-Received: by 2002:a17:90b:5686:b0:3a4:b061:2765 with SMTP id 98e67ed59e1d1-3ae89724af0mr13599917a91.15.1793802435021;
        Wed, 04 Nov 2026 06:27:15 -0800 (PST)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c5aa69fsm9656842a91.2.2026.11.04.06.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:27:14 -0800 (PST)
Date: Wed, 4 Nov 2026 11:27:04 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, francesco.dolcini@toradex.com, leonardo.costa@toradex.com, 
	hvilleneuve@dimonoff.com, marex@nabladev.com, stefano.r@variscite.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] ARM: dts: imx6q-apalis: Add Toradex OV5640 CSI
 Cameras
Message-ID: <5tszst7u72cqju6uk2yxtrdexgmpmqf7bkihnno2753xqgbdb7@modjp5vm3wlh>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
 <20261001155412.3177428-8-leoreis.costa@gmail.com>
 <ar6Ij7KJEPbIa2uT@SMW015318>
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
In-Reply-To: <ar6Ij7KJEPbIa2uT@SMW015318>

Hi Frank,

On Thu, Oct 01, 2026 at 11:21:35AM -0500, Frank Li wrote:
> On Thu, Oct 01, 2026 at 12:52:57PM -0300, Leonardo Costa wrote:
> > From: Leonardo Costa <leonardo.costa@toradex.com>
> >
> > Add device tree overlays for the Toradex OV5640 CSI Camera on Apalis
> > iMX6 CSI.
> >
> > The default overlay describes the current CSI Camera Set 5MP OV5640 with
> > a 27 MHz on-board oscillator. Add a separate 24 MHz overlay for the
> > legacy camera module.
> >
> > Remove the ov5640_mipi node from the Apalis iMX6 dtsi, as it is an
> > external component that does not exist at the SoM level. The camera
> > modules have their own on-board oscillator, so the sensor xclk is now
> > described as a fixed clock instead of the SoC CLKO2 output.
> >
> > The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
> > Board V1.2 device tree to provide a ready-to-use DTB.
> >
> > Link: https://www.toradex.com/accessories/csi-camera-ov5640
> > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam/
> > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > ---
> >  arch/arm/boot/dts/nxp/imx/Makefile            | 12 +++
> >  .../nxp/imx/imx6q-apalis-ov5640-24mhz.dtso    | 17 +++++
> >  .../boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi | 68 +++++++++++++++++
> >  .../boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso | 18 +++++
> 
> Please use nexus connector to share one ov5460 for all boards.
> 
> https://lore.kernel.org/imx/20261001-verdin-imx8mp-hmp-camera-ready-v2-3-7d1343ecd3ec@toradex.com/
> 
> Frank

Hi Frank,

At the moment we don't have plans to add other overlays for this camera
on Apalis iMX6, so there's no need for nexus connectors in this case.

Leonardo
