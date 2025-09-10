Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EFC235341
	for <imx@lists.linux.dev>; Wed, 10 Sep 2025 02:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757470351; cv=none; b=I2QTSRyfdwXor60uZyJGg5Udd5ySxKdTtjrK990c3aCoPKRPOY3LS0/5zRGp56DQy6Bw6+ng+aDxM6CN9Uj6AfyI/XL/Isq4lLZk2c1ReCuQ2B0LN5ERa0iiAHlwqCmbFPTTOcFHe/HGkHH4CgRThOLDEzVjM17Nz260jsEeD7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757470351; c=relaxed/simple;
	bh=i/ZrTEb1zaDJxW36CE3QTF6qXM0oKKYNei/9YnXXPso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kllifz67jf0xJXI6CPUuAggedI2SxNWMncqdduGiDRDup8HYnnfqSdCAiNC8MVLOeHjt4n5bgnQ+7xwZtSOzmbMt4DeIfJRs8dYztYcvOEj7RvqMCX0L0APZ62aUVWuEtJ6JJUHmlrsELCM8SYBf6XveutMhGnCRRamwEe1eztI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b=YA3P66zo; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b="YA3P66zo"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-61e783a1e00so4143573eaf.1
        for <imx@lists.linux.dev>; Tue, 09 Sep 2025 19:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1757470349; x=1758075149; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/ZrTEb1zaDJxW36CE3QTF6qXM0oKKYNei/9YnXXPso=;
        b=YA3P66zo+ht4Db1YEWeKOWMtd4UBOHvn0ghWggowi5VZK1ZS8tdJMVh2OKPtZ7DQcb
         5H2nryBe1kX81hbz/0l2dlkTfXVxirerzUvYSS+Y2c3OsZEMsJFS6V9NV8Xltbe3TK5Z
         BFg1rXiSAjj4TIJA3/4MrTnp1WF43p9CrIEqmM0Xin4mMFOl6y8taH13biQxovw62fIK
         xYZs/5NgJnmf7q4VbqZd6XnbiqIZyn/MZj3XJ8IkR66yu9iAFgdVfdpVsIXsliwMtbFF
         uqwWVD6aQX6wRATH+hq0sShEJzXAB/qpvREuWa6oRX/QJxd+gn68NXllKauNIEuIx2pl
         NcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757470349; x=1758075149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i/ZrTEb1zaDJxW36CE3QTF6qXM0oKKYNei/9YnXXPso=;
        b=oIuBQr17510XrZxcPBcMkRBtibp9ZFltwmpTPnsPvQuQDeMwdLA9B/YbtWSq2g/dQE
         /CAoZ5mI82m2V5Q6gZzdzAT63Tm5GAjVHIvpjx1ddk9CZk5HTalvTp2imcrDhymyGa/T
         erG3crabuIXVDjhQoziMcL+KLJ5m5d75lMPVOwqy0WqLcEXISfM+HooW2gsRL9BEvWhI
         tAaU5AAKWVNrVrkcCT7jwTorBHUqsJ67dhWjc4bq5LKFFp+EksAPZjprX73ZCRAVr4tQ
         ziKdWipF7B7bxq6xt9BmLVbhS3kzCPVFf0q16EL43XfutfPemprkijPlFYn+liagI2df
         he+w==
X-Forwarded-Encrypted: i=1; AJvYcCVl0Mg0yIrycmcXCBOeYFSa5xj4RK60BK1t4US4ZZvTussTKHmKvZ9x+c4qFKEyMhqFiwQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8MDuGt2IZC9LRJv0gSP0VfLPFoUHyAXKIth9ywqu6PLoEPDn7
	UPqFietFNWbqZ2VT8s2n/Lf7QbJY8tsV9JXxPyir6TODswaDzmpik0qGqXjXEU0laKlLGXq+KoD
	Va84LzL91jGDGTyvpUZHJaqcfra1SnoDIHqkI0kGbug==
X-Gm-Gg: ASbGnctF8mBoiaSyR22/tM/rWesBiGc+6WQhKuOtD2gIN6N5FJiFGKloL04ja49UIwk
	j1JVY1NHperDMX/QIvy91+7leQ++B+TnzNjYgIc4ZVGbAgpo5VOH0KDJNKjh6y11XIRUizqRVon
	I2yiTqasuQxIrPIDL2YQnSKoM8r7zB4LSlHNR20VKhg20OO2DI+DIJVbWoul8vkiguyjxk9GWdX
	2pDWYg=
X-Google-Smtp-Source: AGHT+IGYzcv+KGeo8D/B/3mzm8u727rEyHjHkqpXMnOV+fGyUvGB1T/ymTmP3km0I0jXSqieUCPPm6rwERicf/XL/fc=
X-Received: by 2002:a05:6820:624:b0:621:72dc:3dee with SMTP id
 006d021491bc7-62178987debmr5886756eaf.0.1757470349286; Tue, 09 Sep 2025
 19:12:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250815-imx9-dts-v1-0-e609eb4e3105@nxp.com> <20250815-imx9-dts-v1-8-e609eb4e3105@nxp.com>
 <CAJ+vNU2hro_ZoRvmQ9yowKsX25AnrgZdGMn2D-RCkyJA02CEhA@mail.gmail.com> <20250909043327.GD20475@nxa18884-linux.ap.freescale.net>
In-Reply-To: <20250909043327.GD20475@nxa18884-linux.ap.freescale.net>
From: Tim Harvey <tharvey@gateworks.com>
Date: Tue, 9 Sep 2025 19:12:18 -0700
X-Gm-Features: Ac12FXzv-yx0rHpHYzRFsf11y5WuQG_up-EtuFq-TzQXC2JvCVAePG_zRuL6PxU
Message-ID: <CAJ+vNU3=mwZFBqQRNz4i28EjWXX6=Nf7iAsYPEBgpqkQw4wgtA@mail.gmail.com>
Subject: Re: [PATCH 08/13] arm64: dts: imx95-19x19-evk: Add phy supply for netc
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 8:22=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com> wrot=
e:
>
> Hi Tim,
>
> On Mon, Sep 08, 2025 at 04:43:25PM -0700, Tim Harvey wrote:
> >On Fri, Aug 15, 2025 at 4:50=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrot=
e:
> >>
> >> Add phy supply for netc emdio on board.
> >>
> >>
> >
> >Hi Peng,
> >
> >I'm not sure where you are with regards to this patch but it indicates
> >to me that you may have the enetc_port2 10G port with the AQR113 PHY
> >working on the imx95-19x19-evk with upstream Linux. If so I would be
> >interested in knowing what other patches you have for that. I'm seeing
> >the interface fail to register with:
> >nxp_enetc4 0002:00:10.0 eth2: PHY has no common interfaces
> >
> >I'm wondering if there is some support missing from enetc or the
> >aquantia phy required to work with 10gbase-r.
>
> Thanks for raising this.
>
> This is just to add the missing pieces of device tree.
>

Hi Peng,

Ok, but phy-supply is not currently valid for netc_emdio

> For 10g port, it is still not ready for upstream.
>

For 10G it looks like at least the XPCS support is missing. Do you
know if anyone at NXP is working on this or if and when it is
scheduled?

Best Regards,

Tim


> For 10g port, it is still not ready for upstream.
>
> You could only use the rgmii-id port. This change itself does not break
> the rgmii-id port.
>
> Thanks,
> Peng
>
> >
> >Best Regards,
> >
> >Tim
