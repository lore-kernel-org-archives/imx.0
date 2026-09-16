Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1CE4DAFA7
	for <imx@lists.linux.dev>; Wed, 16 Sep 2026 20:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789591426; cv=none; b=HmLGsq2IFD9CJFIhIwh3oyfO5MJXtfuetd3vyWyangEpp7+rixldMV/z2XIFW8e/U5BA/FDnSDTUpgzxEgo6vQ0KNXTq8AgEfako5zeDHaBrurKDMde2aMireKMRcVt9eRtoqxNUn6w13ZnY20rAaUFBnct6p1UBnBnE30VtPIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789591426; c=relaxed/simple;
	bh=vlKw8zEtmmpXHVJ2WbaEoKFzRUul9RS/PINyb7V/eQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EqnHrg0wkKCUW8I0/rsBDpKadu26TQYR8brcgkcDyjCTS81xbUHGou6uQbToQNWDIcFy54OunyX7fQQoiXJ/8OCjHH6AUpaf+PL1+4TVA0kiFdlt5OrG4lhduNQx3KtQ/omfo/lQwJFXSlqoBfPF1mL86iFEc2VwNnDMzR2/Cxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cFyJIRmT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cFyJIRmT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2C581F0089B
	for <imx@lists.linux.dev>; Wed, 16 Sep 2026 20:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789591421;
	bh=vlKw8zEtmmpXHVJ2WbaEoKFzRUul9RS/PINyb7V/eQQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cFyJIRmT3405pihywetpV9hmvKAv22KhfLKYeOpuckrVAnCfD+gwgdUyz8+3eLPkg
	 p3fk4D8iomhYvtCPucqpn3f1wluyTkmYUKZh469vairyUZMyoDxwWu1ys8/fO3xZRG
	 ZN28cx+9w+nSKa/dUp+Y+NaxGjZoKGJc9DJoeRiNhJzlDJZcSrLrPVZKHVohcH47Ba
	 8Ya0PIkUcARM1z6JZ6DylcBQjOQdzYatQzvHBYYogUZWZtGdkvfTYtJA+JGX/QhEvW
	 SdSVsqCx0FkHajBuqXYSwR+Bz/d/6CkT+MZHZRevR/0qJPEpfwnhoXQvjAE2og77Lw
	 Q0iZecZOkIBgA==
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294af0caa8so27922866b.1
        for <imx@lists.linux.dev>; Wed, 16 Sep 2026 13:43:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByjvbFHRQgM8emkQTMkkhSdjL1L/Qz3NaHa9jsk51gyvW+1M62dSmw6uYkL58ixhLRIxA4=@lists.linux.dev
X-Gm-Message-State: AFuF++mazWcWpr480+PcJyCYJJzHK2NugZ0tPJ/e8SV2gQ5DTTaLQ2IR
	5w3CkMnMLpzH6mBZ0qy3mn13mU51nap7DWtbUsbnD89uVChBk3Y5Dl7NDqHQ/8QuZhloGKotFvE
	DcxqxdZXWf/Mj37gDmWOhWLft+IupSw==
X-Received: by 2002:a17:907:c78d:b0:c29:43fd:e43b with SMTP id
 a640c23a62f3a-c29e5392d7amr305474666b.28.1789591420459; Wed, 16 Sep 2026
 13:43:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260720-qm_smmu-v1-0-3689fbd8b516@nxp.com> <20260720-qm_smmu-v1-2-3689fbd8b516@nxp.com>
 <20260720212401.C2BD31F000E9@smtp.kernel.org>
In-Reply-To: <20260720212401.C2BD31F000E9@smtp.kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 16 Sep 2026 15:43:28 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJkL57yUCF41BJvsoJkhhRb8xnukdtxe61fXB1r_7gK_Q@mail.gmail.com>
X-Gm-Features: AcwNN1WDsCQvtNQUN8sanOdeWarRT8BUGDlcRUxPHV8tyHR0Hu5vmuAcP9BJDpw
Message-ID: <CAL_JsqJkL57yUCF41BJvsoJkhhRb8xnukdtxe61fXB1r_7gK_Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: imx8qm-ss-conn: Add HSIC usb@5b0e0000 node
To: sashiko-reviews@lists.linux.dev, frank.li@oss.nxp.com, frank.li@kernel.org
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 4:24=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] The `usbphynop2` node requests the wrong power domain (`IMX_SC_R=
_USB_0_PHY` instead of `IMX_SC_R_USB_1_PHY`).
> - [Medium] The `usbh1` node is enabled by default (missing `status =3D "d=
isabled";`), violating SoC `.dtsi` practices and causing unconditional prob=
ing.
> - [Low] Missing required `#phy-cells` property in the `usbphynop2` node.

This reported issue is now a warning in linux-next. Maybe the other 2
issues are valid too?

Rob
