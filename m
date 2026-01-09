Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7507338F5E;
	Fri,  9 Jan 2026 10:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956091; cv=none; b=LuJf3TcSNWTu7MMH1Hl7mvaf4ZAGS+dsQdir8ozwOy9PAE43XNDyUY0RIFGtgWJ83iTZA9J5O+2eK7volOJhz5ueGYxovrWW4XNWklL4FvkHbyL0mYUZkyr6eO/HvOTVddnQTpN9BoAwbHC2Up9mh7IWVRRtagXpCbugh+3CAM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956091; c=relaxed/simple;
	bh=UJG+fnw8Qh3YOXILE6R2Q0v2U5Bs1ONSSyoTBxazsE0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XySOd9n94L+ILoVULNJw18BkPDxXDM1ViMdPUEP5/fCTZloKZqt9GjqEGBcus59/SG0Ch8d/fRrn7Shd+bHaxzSolNaPsUozIsw2GOzeSPtvQnkiCrXM243Dj/kkllO9Anh0r5c5qDyBmFcU+3G/Scv6iy6xY6m1dXFnPMP1N3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PkfxoPqm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PkfxoPqm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F89FC4CEF1;
	Fri,  9 Jan 2026 10:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767956091;
	bh=UJG+fnw8Qh3YOXILE6R2Q0v2U5Bs1ONSSyoTBxazsE0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PkfxoPqmix4UJko2+N48KVvJ6KGdbXv1RjFqFc+PKKu7BSHtvMUJpWIEYB3xrVCxt
	 Ew5CVsYAMTUN9UCLkbDjraHwqudJMumo5v86gO62WDNcvj3d2vlM+N433St/MSQ2Ds
	 XS/sTt11Sr0Ei2Ysm/z+EqFaJHN7mdGWNIS7FTCMx61yUXgiRV3IkyTNWM+5S6KWz0
	 EBoFXUP/7cwoWw05ItHjJnoQ0iqgXopncSYDjgV6it2PMjHZwBRBep2vAl7ct6cuaG
	 MEQTZ/Y7/MgiuTM7LGni6wzIYNHIYlqkZ6rCZg9zCz02nURGBkqQMrIceaBxxkUBcE
	 7xCW93OmzYArw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, linaro-s32@linaro.org, 
 NXP S32 Linux Team <s32@nxp.com>
In-Reply-To: <792d3f59b9f519529b94e673faf70d77c4b61fb3.1765806521.git.dan.carpenter@linaro.org>
References: <792d3f59b9f519529b94e673faf70d77c4b61fb3.1765806521.git.dan.carpenter@linaro.org>
Subject: Re: (subset) [PATCH v2 2/4] dt-bindings: mfd: syscon: Document the
 GPR syscon for the NXP S32 SoCs
Message-Id: <176795608886.1640392.11563131653526245122.b4-ty@kernel.org>
Date: Fri, 09 Jan 2026 10:54:48 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Mon, 15 Dec 2025 17:41:52 +0300, Dan Carpenter wrote:
> The NXP S32 SoCs have a GPR region which is used by a variety of
> drivers.  Some examples of the registers in this region are:
> 
>   * DDR_PMU_IRQ
>   * GMAC0_PHY_INTF_SEL
>   * GMAC1_PHY_INTF_SEL
>   * PFE_EMACS_INTF_SEL
>   * PFE_COH_EN
>   * PFE_PWR_CTRL
>   * PFE_EMACS_GENCTRL1
>   * PFE_GENCTRL3
> 
> [...]

Applied, thanks!

[2/4] dt-bindings: mfd: syscon: Document the GPR syscon for the NXP S32 SoCs
      commit: 441db0e922485befe0cfed2523e8e452a3b5f7cc

--
Lee Jones [李琼斯]

