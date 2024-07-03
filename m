Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273A418509F
	for <imx@lists.linux.dev>; Wed,  3 Jul 2024 17:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720027656; cv=none; b=uEa2RJLINF13VLHPewLO75bpAF9zEK2ekOjhmjzjXFMC4XzBIX5OuZgG08AeD8lphfb1/c5umx89v3Go9yIzj1UtXRSCFAkcIuILGjotWX2h/cupeApjeFw2j4FPX2isK1Ba0EEKmLvWqMVjQcfITVRfNestUdJUv23lZs+9FGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720027656; c=relaxed/simple;
	bh=iFfFLyRR4NKzA0uRmH7SbrjhQCJSeaFOZGeQ9iRrJaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TH31Nma0FBhHedBwioc7SB2SFuZMA4gGSdMok3pbQ+XNd+w27XTPCXwTmYmAKd1eUon58xhZmbRyYUNkoEGjQkJ1PUTQEXujbXO1zyujwFW9vn/Ybh33nSEH+76TPE2Ow9acVbnfBqMLqnn7ylK71Qx5GXnd6Ygef8NUFzKidKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pvVt+s2R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pvVt+s2R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D46D3C4AF0F
	for <imx@lists.linux.dev>; Wed,  3 Jul 2024 17:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720027655;
	bh=iFfFLyRR4NKzA0uRmH7SbrjhQCJSeaFOZGeQ9iRrJaw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pvVt+s2R1l6h3nhFnqFqgUUhQKgkxyIBM0UxIFco9SDejuGh3qxZpI68t+YepUdO6
	 c35fjyVDwtZyzzYAaTDIAsczhrrA5+ruc/5VIJJYw7ksZDoPARTKuQN2xNFw8TyGuq
	 CjKISht9ZQmMjJXWTT+VI43tnp4ELOtcekCrkMKpQLPTCyILoo5k7LUa26NO7flFol
	 Z7jYzizu2kVEC0/JgdeJfNoB1sNk9LMVOUH74HPzm84JyXJw/Xpv5fAO6WchUOMD/N
	 AgpC5QnwmKn5mCeQmT2IpSW2uZHeZzLTLMOz82buZGcD0T2tEmNbd6chDp/GK2H9wj
	 LFNJ/83Bov3ow==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52e8b27f493so4354201e87.2
        for <imx@lists.linux.dev>; Wed, 03 Jul 2024 10:27:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWZOJAh5WhXiYq5qrM5Y+TKqyu/S+kt58x9HND6xMA9BirpngCV2VeQwLqBhkXBqnt7SPJo8XVp0qoNkRLUfEdvypeB
X-Gm-Message-State: AOJu0Yyal+Sl7OHHrCIJP+wLN0IwJGp3sbdmNBJ+O4S+JZPjgLWp53GE
	zqf03vOZFByzaph8UOnWpA5qNeGEu/4C9V2qQc1Q1mC68peXCgAeDu+WtrcyYj5J1VuU6BC6Q40
	kLc0R5bpLNAdVr9qVt1fjgE8Z4g==
X-Google-Smtp-Source: AGHT+IFmnVpVLkHOR4OyhwwWXMbNwcQroLw1eDcjH+AFCp9Mx2AAlCzY/SuAEQV5/G8Q9NrPXYmHuLUWLyi5seGzG34=
X-Received: by 2002:a05:6512:3e1c:b0:52b:c025:859a with SMTP id
 2adb3069b0e04-52e8264c51amr10146708e87.2.1720027654197; Wed, 03 Jul 2024
 10:27:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240701221612.2112668-1-Frank.Li@nxp.com>
In-Reply-To: <20240701221612.2112668-1-Frank.Li@nxp.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 3 Jul 2024 11:27:21 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJYN62GO_e_+vrCdF3C9g+72qhPgzMrrXGtDJfd1rRZhw@mail.gmail.com>
Message-ID: <CAL_JsqJYN62GO_e_+vrCdF3C9g+72qhPgzMrrXGtDJfd1rRZhw@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] dt-bindings: PCI: layerscape-pci: Fix property
 'fsl,pcie-scfg' type
To: Frank Li <Frank.Li@nxp.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 4:16=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> fsl,pcie-scfg actually need an argument when there are more than one PCIe
> instances. Change it to phandle-array and use items to describe each fiel=
d
> means.
>
> Fix below warning.
>
> arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb: pcie@3400000: fsl,pcie=
-scfg:0: [22, 0] is too long
>         from schema $id: http://devicetree.org/schemas/pci/fsl,layerscape=
-pcie.yaml#
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change form v2 to v3
> - remove minItems because all dts use one argument.
> Change from v1 to v2
> - update commit message.
> ---
>  .../devicetree/bindings/pci/fsl,layerscape-pcie.yaml       | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
