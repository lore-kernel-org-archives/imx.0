Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD30D3DF003
	for <imx@lists.linux.dev>; Wed,  2 Sep 2026 17:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788369492; cv=none; b=jbp0qwGQt0KKKzOkwNpyMFeWGPPepOX+hdFmYMN3AHMHfDvsT0otAXa+lD4e+RnNLf2oEgIWvTVRTCJw7ons8fHNQyvY2jKnZ3j2jksD55WsjyPSdHcdUg79xYZC09yDdgYYSqD4BUk6QHXQD+CTzMa6mvpMH0/AEp+1yFzLQB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788369492; c=relaxed/simple;
	bh=6Tn0OaGLRreTIGbEtttcTbq5pI0t6SsPxE+m00j3r9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hhJ8e4MRxzb++INdD/ZhCGw6c/GKZLC3cAphsWWhbTGfn0sLr3nJ8LpCPAwN5TRnFsxV06M8NUQlkecbm+fF/pqzTMHXE5HHpkG7M8V/u1qQV6tRQzzkG71WM10Vhksgv4Mo2TUJmKK40KT0JRwA7wffYXaSWxQO/Upf2g0tZaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mhEDrhmO; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mhEDrhmO"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso9513695e9.0
        for <imx@lists.linux.dev>; Wed, 02 Sep 2026 10:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788369489; x=1788974289; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6u2dskLwsFp3RaJUgt1/pKQoZpVju/VbValCvllVzDM=;
        b=mhEDrhmOcW/07/Cc3tM4h/JO/Z5DrFDv+Zomx7PI6/v0rRvb7JJgEdIxbToaS9+l19
         0rFJHOmCkxp1fPRK73PiiWic20TS6Mn3K6U8iDY2/Ox+Pb9HERkYnzN7e11FoCUM4A4F
         r3jNCQzOoXXGr2qfasL5bV2iFVKsl7K+YmrTmVMTOqTk9l9BxXIIbim3cVyB2mrvxi4S
         PTml130/eVFltnCRZNbatdkz3kaGA526qDCN0BUx+6QQN5x0Dg5cJQYwFnCoiw3RONiq
         7kcr+9h7+RTu7wMBMkRVzItd4VQsqr4817+ZxLFIpcHmwgPCouy3ciZehFicO9jHY6Ih
         wBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788369489; x=1788974289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6u2dskLwsFp3RaJUgt1/pKQoZpVju/VbValCvllVzDM=;
        b=EhOowrcl4FeqiHbwNefzDSU5J0P4SvbAUQUEoDWWUg8bUEamro8ABaQR8ZxiR98Rcg
         iHx858+9vIpAb0uKDHlUFKNsGFrNdwxsKEfAQnJQro9Mm7ZowYNY+xSLeF/8Ez0Yi5P+
         DrH2dFeB1L3z0CESOR1trejGMapWAvjsb66VvyVxGj3X1rjEfZjoaPzcMgO9MAo86joD
         tJA18mkJMpWc+nTnkqNFrJIF1H65k8bj+57xw+mAEeTWGCaqby9ZD3fFitAFTg3Zz8ob
         Hr6hfIPQFvoCmY0lHCULCCzW0eGVzTSA0lI37cQsXaYfiukMablB999iVOcSn0N6B9mq
         WOaA==
X-Forwarded-Encrypted: i=1; AHgh+RrFAxqoA/xEaFmi5bKaFG+gxBoqPk/WG/kGE32GROrjlhGukJ1ahHOdAG+rBjgFKCZohD4=@lists.linux.dev
X-Gm-Message-State: AFuF++nUNeU8sfqwcVRVwzvBk91csCNcFny5vQ684Gb6c2w4RM9ToaMT
	G3Orffz43PMc5BJCfSl4VLh4yFpXr1EYv7wqx3GDwM26ZgUg1TZgKfoj
X-Gm-Gg: AR+sD10k6Hbb8TifzIl8vGzfy7JJJRudyJyfhWglbj740NCIzQvzeKIBrLHcdAKEFzB
	zUTYxLlEL9QFRyrozeYpfM2GNpwuKODoEKR+Zk86QlupjjzThmCRtYVwe8UeWOBjuwMpZqebERo
	LjayByu8wsLVn5kkVntUZHkga+31SNk0FX4O++IHOTXeeJNGOYx65hujrHO45tthRPyYVxIoj07
	MDo5ROPiHn1AAPsg0UqC2mojnxYR2H4OidD/ZycIpB9iDMusWyipX5RZJHkZFh4GNs1rhOWMm56
	dKQBQ3kwejOHDlsa4NeraKrlb6CODuPPdo35ylZg4JtQcvwdffdS15YHKC0Vl+dPrw8Cwpb6RLk
	XzFPvDULyFPnBCSG9lq4L0OOLdDaqSMCtrF1JLZDmYBWuETqBI0YR10wXVE9U+lZkIhD1wCarqZ
	PtU+iAg2Y5phI023W5X925cpPwg++rmOTyruQnUB6E9dEpzDn5G404MiXwo8ZZ9DEoWaAITZbBt
	BWm
X-Received: by 2002:a05:600c:4f88:b0:499:d366:f572 with SMTP id 5b1f17b1804b1-49ce58388demr95277025e9.10.1788369488491;
        Wed, 02 Sep 2026 10:18:08 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e80020sm8076593f8f.10.2026.09.02.10.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:18:07 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Wed,  2 Sep 2026 19:18:06 +0200
Message-ID: <20260902171806.4141524-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902155931.38FCC1F000E9@smtp.kernel.org>
References: <20260902154525.4090276-2-mehmet.fide@gmail.com> <20260902155931.38FCC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> [Severity: High]
> This isn't a bug introduced by this patch, but since you are adding bounds
> checking here, does imx_pinconf_set() also need this verification?
>
> Without validation, a malformed gpio-ranges property in the device tree could
> translate to an invalid pin_id. Since imx_pinconf_set() lacks the
> if (pin_id >= info->npins) check, this unvalidated pin_id could cause an
> out-of-bounds array access in imx_pinconf_set_mmio():
>
> 	const struct imx_pin_reg *pin_reg = &ipctl->pin_regs[pin_id];
>
> Could the same missing bounds check also cause out-of-bounds array accesses to
> ipctl->pin_regs in the GPIO direction callbacks like imx_pmx_gpio_set_direction()
> and vf610_pmx_gpio_set_direction()?

No. Everything that reaches the driver through a gpio range goes through
pinctrl_gpio_request() first, and pin_request() looks the pin up with
pin_desc_get(), which fails for a pin the controller does not have. A bad
gpio-ranges entry therefore fails the GPIO request, and the direction and
config callbacks never see that index.

Which also means the npins check I added in this version is redundant
and its commit message overstates the problem. I can drop it in a v4 or
keep it as a cheap guard, whichever Bartosz and Linus prefer.

> [Severity: High]
> This is another pre-existing issue, but does imx_pinctrl_parse_pin_mmio() also
> lack bounds checking for *pin_id during device tree parsing?
>
> The pin_id is derived algebraically from raw device tree properties:
>
> 	*pin_id = (mux_reg != -1) ? mux_reg / 4 : conf_reg / 4;
> 	pin_reg = &ipctl->pin_regs[*pin_id];
> 	pin->pin = *pin_id;
> 	pin_reg->mux_reg = mux_reg;
> 	pin_reg->conf_reg = conf_reg;
>
> If the parsed *pin_id exceeds info->npins, this uses the unverified index
> directly on the ipctl->pin_regs array, leading to an immediate out-of-bounds
> memory write.
>
> Does imx_pinctrl_parse_pin_scu() have a similar vulnerability when indexing the
> info->pins array with an unverified pin->pin?

Yes, that is the one real hole, and it is where the fsl,pins value is
turned into an index. As said on v2, I will send a separate bounds check
for the parsers after this series.

> [Severity: High]
> This is a pre-existing issue, but can concurrent driver probes cause
> hardware state corruption of the shared input_reg in imx_pmx_set_one_pin_mmio()?
>
> There is an unprotected read-modify-write on shared general-purpose IOMUXC
> registers:
>
> 	val = readl(ipctl->base + pin_mmio->input_reg);
> 	val &= ~mask;
> 	val |= select << shift;
> 	writel(val, ipctl->base + pin_mmio->input_reg);
>
> If two drivers concurrently request pinctrl states that share the same
> general-purpose register, and the pinctrl core calls pinmux_enable_setting()
> locklessly, will these RMW operations race and overwrite each other's
> configurations?

The core does call set_mux without a lock and the driver has none around
that read-modify-write, so in principle yes. This series does not touch
the mux path and I have not seen it on Vybrid, so I leave that one to
the i.MX maintainers.

Mehmet
