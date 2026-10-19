Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89063E3D98
	for <imx@lists.linux.dev>; Mon, 19 Oct 2026 10:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405377; cv=none; b=ERpA/DYVmbGQztv8NnYjcWXl1BCGbA/b3R77Krljn89Xf0nOvoyxJhuonI/Utgjn0/2+OR+UquWpMjaexL4z7O6PJjr1VNh7si0PGpuCspSCEudH0yMO0wD/lcSSQLRHsdq4uRBJduQH33REnD5iZg7EYqqJHDBgyAjgvRumTzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405377; c=relaxed/simple;
	bh=kUUpPsTxPIwjQ86JF12+BW4PvPq7GSCiTMS+HGO3pjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pyH96rCyo6q5poCodlgRG9QS1qcT3O7C0Iv6LDgb/o7ZiEkV7sLM/1EPpi9TIAn1YJBb5XsBpkIoCmYWHn8MDXv1oLLGog3INU6nUpqyUN/E0sRq4NUPvsitDliyaT2bZV0csmGoU6m5wB9+EhQW3WCTYNrEvh/BUiCu8ePgrww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XjebvyWB; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XjebvyWB"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so1550185f8f.1
        for <imx@lists.linux.dev>; Mon, 19 Oct 2026 03:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405374; x=1793010174; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DcQm1UppAernfyJDNeazwp3tPSiXo5FxZGSLgNLJYCQ=;
        b=XjebvyWBlQJXALSYD7CVA5xJiE1F2J7xgBZ/5NoELutF5nAAy5NiOc7INiZgdPETGv
         6iRvNMR9WMF/wiu+qfudktZhfpZ2bHxMmm0VFQIRvHVCptNIodwwgRFZ+Ns4FEP9j6Ks
         xtmH3v5/QoUiiYcN0K9uUGJa9DxokG8oPH5iR5fGTEfCc/HZzOFu+ILMujICt58XLU1A
         PhYny+gM5GhEP2WrPWW5UbGiYngHtTfUwzom+4Cw7n0/C98+EfxuoBMEtHV6BvVrZm7e
         KuwdeaEEZ0SZD1MKRd0sVCIePPXbGTRKjSq2WZWMzKk6kjSOGFMhOzS+SKFZ3rGH2EZ6
         a5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405374; x=1793010174;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DcQm1UppAernfyJDNeazwp3tPSiXo5FxZGSLgNLJYCQ=;
        b=KO9lww7fvffrQb6XbeOYk+qP7QQZWXFG/vO5mDEmY/xSEjlwgFv1Fo6xxMBIskLd8i
         QtGO9gi+cR3ZQm28JM/J2N3KAPaEb5X7Be3LR4vI1Q2dlafNyrb/IIyTC6AFIDDf8OJ/
         7fiZccVY+5LlRN8ziI9/vGd8X1hesXxsu64z32peSZLYGZSciEmSkpDCJ2za4GHcVpMv
         6OTO9Emx6SC/Nqk/LV7HVg4ohe6bricb/hXAwPtJnQWLf1hBMrQggxe+PhYnic72YeRb
         +4swSPLt9tDsXTZ7HtAjCXL6nf3sOWnfasJk+HlMadV4WzuwSfx3yYnVM4ZsI/bG70Wu
         Om/A==
X-Forwarded-Encrypted: i=1; AKwUvByIpxdnMcj7fDTBsStkzoei9M5jArFsYbzYAA2Yaad6b7xhCqf6xZqcAMlYKPC3W1+aVbQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYKHY+4avtSM1YFYX9lomyFEAD6ZUhRNH0A+EcD8k8QS6ctpSjcn
	hMgDAHott9MbJsJgQq3hRCGQvqXdiHtd1Fn8x4yn4njxrFHRUAImMfdv
X-Gm-Gg: AYBFou2OdazT6KaHxWFkBeqMEX6motg/Lp9UCAR78vdw9jLP0L2FSfV2UuP6jTgyKWd
	U5m9jvoT9ic9dEVbc4ggbQm4a/HtF4E4CDCbeNOs+heq3TF7qMcDaUbwDnBq/bUn01Kb3D7axF+
	XykDed70STkEtUM+j5d3PfFD5TLuJ9KT4v+iYFszQcBLYIUxmgQZZkuUvQLsBx4JT7Fc63EI0af
	+fqJtz/YgnzGeqbqmpl2OV+Og/0pPRBMIlnUHAqMJBeMSxiv+T3tgmuAgqe4DjVcWbg2DAbfTYo
	n63KayHxnXgJqLD88B1VrxZHu5nVpMNWlr5TeSAQ6TIX24MqrFmrpAG3DplA+sKaDRayuLCTZ4M
	pEY1A1gA/D0DOBisryRGdKvZLEFMh4arSpEMkFZ+VkawcjLP/Bfh0fj8klBR+3tC0tJKCIVdfQP
	kOfQMTQspU38bEmVVQolA/DXm4KZ3YDJuDyi+LZdlw3V/utFEVoOz4bJaBDyyTTeNhQzmd1vLUf
	njpRYo8R+3RuMF2yqAh4VmwalugH/wWGZ9uzHRgKV/Hr7tiWRXWEZ6c8bMCPFbLQLKU4kCywtFM
	70Djk6W4gIUlrk60AwLXVD1ZnRIRpo9cCiKZZgA=
X-Received: by 2002:a05:6000:2889:b0:48d:f14a:9179 with SMTP id ffacd0b85a97d-48e07fadef3mr14864487f8f.48.1792405373733;
        Mon, 19 Oct 2026 03:22:53 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a64sm23771242f8f.6.2026.10.19.03.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:22:52 -0700 (PDT)
Date: Mon, 19 Oct 2026 12:22:50 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx8mm-var-dart-sonata: Add OV5640
 camera support
Message-ID: <atXver4B2Acc3z0w@Lord-Beerus.station>
References: <20261015162301.63838-1-stefano.r@variscite.com>
 <atEci_KwxUdvAekv@SMW015318>
 <atJY6DzjmAeq7U8q@Lord-Beerus.station>
 <atKHI1B0hL6q-CmY@SMW015318>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atKHI1B0hL6q-CmY@SMW015318>

On Fri, Oct 16, 2026 at 03:20:51PM -0500, Frank Li wrote:
> On Fri, Oct 16, 2026 at 07:03:36PM +0200, Stefano Radaelli wrote:
> > On Thu, Oct 15, 2026 at 01:33:47PM -0500, Frank Li wrote:
> > > On Thu, Oct 15, 2026 at 06:23:01PM +0200, Stefano Radaelli wrote:
> > > > From: Stefano Radaelli <stefano.r@variscite.com>
> > > >
> > > > Add support for the OV5640 camera connected to the Sonata carrier
> > > > board's first MIPI CSI port.
> > >
> > > Does this board only support ov5640 camera? Suppose ov5640 module also use
> > > for other boards.
> > >
> > > Can you refer https://lore.kernel.org/imx/20261011-expulsion-frivolous-690de090cf9d@spud/
> > > to define connectors?
> > >
> > > Frank
> > >
> >
> > Hi Frank,
> >
> > Thanks for your feedback! I looked at the Toradex approach you linked.
> >
> > In our case, the same connector can also accommodate Basler cameras and
> > potentially other camera modules in the future, while some of our other
> > carrier boards use different connectors.
> >
> > Given these differences, I would prefer to keep the classic approach proposed
> > in this patch, describing the camera directly in the carrier board DTS.
> > Do you think we should still use connector bindings in our case?
> > If so, how would you suggest handling these differences?
> 
> Need understand whole board familar, basic Two problem:
> 
>  	Does carrier board support difference kinds camera?
> 
> 	Does carrier board or camera module reused for other boards?
> 
> Frank
> 

Hi Frank,

Yes to both:

- The carrier board supports different cameras: we currently support
  OV5640 and Basler modules, and support for another camera is planned.
- The OV5640 module can be used on multiple carrier boards that share
  the same camera connector.
  Other carrier boards in our family use a different connector.

Given these combinations, would you consider reasonable keeping the
camera described directly in the carrier board DTS as proposed in this patch?
This would avoid adding complexity across the different configurations.

If you still recommend connector bindings, how would you suggest
structuring them to handle these differences?

Thank you so much for your help,
Best Regards,
Stefano
