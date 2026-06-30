Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D11419305
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 13:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827060; cv=none; b=lYNPD50x4Fu2nQesLuJHUXtiv5ogZzMqPQC0iVsQ7jiWHjR5jDg+mkEtM/5WqDrKHqJPqaaEVmVEvguO/atKXazYTEr8CQEF9+PBUCYPDBivYyJ+Gp3rn2z1gT3kKeChyYXD8QGMbnJ9dX1h725Jtz4jiOt0bPU9KfjiHu61kfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827060; c=relaxed/simple;
	bh=OYCefOR8vjCtIV8BcqF9Hkp33X+MIV9fQRrf2VF2Prw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IOOFYHBWWzkMZk3TxoPjG654NjEQ3IMAo6bUNcOJb5QRQ76xv2U/52dKQvFHXrZEkDDxCWsKBG6ac8tpR52T9D2oHVWL8Oj/cKwbmDbhA5NZyruHhj7jNLcTnyz9mwaCqfSJHJViyDSvEhxQUHnskCJMCGEk4vl8F9dIpag24FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YXMCdVpn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YXMCdVpn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 726EC1F00ADB
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 13:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782827059;
	bh=PTgTBVx6F2sw1dT8/Wpsaw/p93LgkfWgt2++tnwdsew=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=YXMCdVpntJnB93OzkvUVDbtYFd5zhX6pWrdfMuh2JCwfvuYS4n1e7MUgDjDc7Ox4t
	 s6th2MipiElRnWHqws9n7L/cj9offTB/GKb3qsHlugOAtLecitT0cneyhDagFiS6B1
	 2OMwTRqTEtXpBfNywSUPHXLxwqAqhoTI5AmZNel9mDUAg0RznYYyBhcXxVje6V7rBB
	 kMQkHkNLoixA4SJRMtRN8KNDkTVz14wg5vSiv4Va/CllGVLgpz17B+G6SY4lQ6N32l
	 JCjx0VVRdj91MSRW5CMXNffi/RGslJBYsxhbcNyVHWF7xY8WhqIbBdFW68U1fhhwTV
	 tCC/dXQCAbdrg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aebfa21c62so605264e87.3
        for <imx@lists.linux.dev>; Tue, 30 Jun 2026 06:44:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqwnTtwPiHl6T7B7RbEOiaqU5DzJdvhP+DrM0ZHjRLKemyGrqwONGZHPs7pv8a41Ocx128=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9DWUahHQZk3r9tuFyMUa+3+23OoGSth0A/pI58Are4aueOsaW
	AnOLV7sSxPf+qBHA4jToqSY1NgbHVS2YJRnP3488G4hhFShvqNui8QGdqhdNPe7lt20yXIdD1hk
	8/FfoKeYaKcibTzn0yNcn6FoAM0z4yGpvDU5PddCQvg==
X-Received: by 2002:a05:6512:247:b0:5ae:b36c:81c7 with SMTP id
 2adb3069b0e04-5aebdbd6a94mr630626e87.35.1782827058195; Tue, 30 Jun 2026
 06:44:18 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 30 Jun 2026 06:44:16 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 30 Jun 2026 06:44:16 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <akOZFIowVvprnAMf@vaman>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
 <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
 <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com> <akOZFIowVvprnAMf@vaman>
Date: Tue, 30 Jun 2026 06:44:16 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfgAB8bc6PD-6jw_KR0uNBfH+PO2XtCeL1SUF2nCiT0xg@mail.gmail.com>
X-Gm-Features: AVVi8CeqiAShkPsoXNMgDMxOo0pT0xgKjAcbHHtz1YU8sQeDIyMdI3B6eTWFAXU
Message-ID: <CAMRc=MfgAB8bc6PD-6jw_KR0uNBfH+PO2XtCeL1SUF2nCiT0xg@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Vinod Koul <vkoul@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Radu Rendec <rrendec@redhat.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Jun 2026 12:23:16 +0200, Vinod Koul <vkoul@kernel.org> said:
> On 29-06-26, 16:51, Geert Uytterhoeven wrote:
>> > Russell King asked me to put the PHY logic for SCMI pm domains into the PHY
>> > driver instead of the MAC driver where it was previously. Instead of cramming
>> > both HLOS and firmware handling into the same driver, I figured it makes more
>> > sense to have a dedicated, cleaner driver as the two share very little code (if
>> > any).
>>
>> I think you are mixing up DT bindings and driver implementation?
>
> Should the bindings change if we have different driver and firmware
> implementations? Isn't binding supposed to be agnostic of
> implementations..?
>

The way sa8255p implements SCMI is with SMC exclusively but - since even base
support is not yet upstream -  maybe it would be possible to expose SCMI clocks
like some platforms do and reuse the same binding.

Would it make sense?

Bart
