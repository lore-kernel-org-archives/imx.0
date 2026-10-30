Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793345322;
	b=BwYUVW1ULvblQFB5Q1o7d/t/X2AXu2uTGDudlOoRSiWUInAUqr0fKUGKIYUkdbRJrjVu
	 RVNJd+tqUqRtS+erFNpDzaF7ruxjLm8EX1K4ODX3Lfuvhamq8SACPmtJhg7rhj6520Bkn
	 iqSAbuezsk+1blCesNaLNg7wWmm72DoKbAvcLW7z2NmzZMxQULvB022m3G3/I1aIwIpGA
	 Y5WLHmvhuseH/7lt4CUorENsEY4M8tb6T1ia+awkuyEmHuDMzpNK4z6cyHuU/Z11VsvF5
	 kGBoAHy4wfYnHYktU11PicMLrcqu03N/BSxf8VEPIVZKJFJju4YwBKbpE1wDWyD4QDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793345322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
	b=fWtkbrXGGRsHFsW0E15DOyAZhYEEDyU65L/fe1X6WlH61P/xikokcdw3Of3vpapQCkze
	 zKZTb/TVQYmlvRf9n9su3GNbOKVqTnhLVzqt+WgOTwV5upDO2Q45AfyCD8AJHOyGWIIXA
	 yeF84XmS7FfkZwbBfqlOTVkMttdeCA74dM1VVzUxxEvVT0p3Phmqj2AGrqnqn5VXEmRmT
	 96HLyoklXGtkv4NP/PlA5vQM+bI8qrqfkUdsJ5xkNBycwyv54l5GO+x/0aSNEQOvi0pCY
	 Rl28IHLd2KLCL49TUmi78PXcYr3Z9vHR3OMoZSONvNSifTYwcJC/HRws6QhqYdZv4Bg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=e1u0VV6S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21281606A31C
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 07:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21281606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=e1u0VV6S
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6798c43a3d6so258935d50.1
        for <imx@lists.linux.dev>; Fri, 30 Oct 2026 00:28:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793345320; cv=none;
        d=google.com; s=arc-20260327;
        b=RPMq+A3ErqQXR0B4U6FL3c1U2te/Uh0IexFpl2o+WB5hN/f8SpyE6ZEDWUcuKMQkUm
         9WYqdHlB6RdBQhTJjltXUqvVPnpDS5CbAF7/+IUUN9OLco6dZaNnP+x/0KZGubz7MrCX
         E63kDUN+KMT+XDQWkV4tIH6N++hz6ZiDRscTK28B/USt5GfvTHfAFmDQhzlpiab7j0Q+
         YV3qeI6SQW64Ys24d8O8NM+vgEDQufLOlEaBzIwXc57CUKiXgCgCiKYlzXTAFM4Gktzj
         5SmuMWvcxvOhc+yRhHIRgOEmhYYiNEda/o0wLRpHAFH4jnVsqO/8CVrKC7lgLxuEkL2f
         rPUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
        fh=z0w5ZQr5l0E1Om7T1rTrTjuGN66A9O/fg8DSKQ7W0xY=;
        b=Gp/qGxTE9iThNu/ptMBEufB3oXSK3kun9mAGyPdnm2MS5FpfXHfJL/8W/4+nBEiD11
         Yq9y30LwXi8sI5RrVbx1Zy8XVCQ6uVGznB3qG58KdNKHhaXe8+xi4H2niSNMTodpdACh
         Md5xDgpr3W1RS0eyiy09zMjc+GYQ15MWetYA4LTTe9u1/qvtRIzwhJT2lgR8BATGlCER
         svvXueUh4hlPJ+wHQXaokcn9J20g3zlRn3/mEZIlvUUuJy8tRN76j8MuNeCmtR/SLBN3
         ocDerCSRcaK+KfeiQy0AohcaydyLwT6kn+EN0fjV9Ra8XxSmXWvi32gFNb1K2G3UW9L4
         N4xA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793345320; x=1793950120; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
        b=e1u0VV6SYYi6QwkU5B1SPm4uMgQEMGybYXZ9uSg3cTIQIrOR6jI7TRHyt8+RLRnsKu
         SD28AoKJymf63U88/p2P/pBw49IVnR3k6iH77w6D/KNqfJEdAjs83tfIItQ3/9yT+UrP
         M4DgrwOBWQRyivBSMu8N3pfkb6d3GyzHK98Zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793345320; x=1793950120;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
        b=Wojgz5UK06MjprNscKDIqbZ2VS0HrAo/UfSuWyYCaJnk064prIC0uqdBgJe36R9fw5
         UIDsmQeG/5Aakdwq2GSGGV1qSe8YPF+hMaUFvkQJCs3Xa0KoDL2mg6uyXgzBUuQV2J71
         a2r6aInbwZJXYPt170+S6x91uvJmv+4gjgQUWVZmuv+re9xhlDkN06i5mOKDR60mHYBe
         /3K5JJhm8WESOl72lq6xoacCZWpS8PxaTYBfe9Ifbz0+eiE76vmBUiXkyB2eLWbVxT6+
         xd+rlC9ptUWqBymGH9RczOrDlgMwzhqqQD/k3rGgOy/i6vV7pZy5sWJ/NJ53rBTLYp87
         JVew==
X-Forwarded-Encrypted: i=1; AKwUvBxKaI9ANwGMj7njEtACzQwzx2TWjCXi/z6HUMLNk3iLUZXFCVOQG1ESrf70gworL36Dt6k=@lists.linux.dev
X-Gm-Message-State: AFq9FYKNWPRzOZO3GLiidRqRlQ+/+PjuVyIaS5ti8mGeFtdBl5rc4Gu2
	q27Cn76X38rvbYqXNElMZ2wAk4n0JFMCOstQJFRg11Gh7/lu25qOF20ftVv1jKYDrluCzt1q+X2
	24C7E82AFuqHXfdCHcPps4xbEzNFZMSRGk1x8COaK
X-Gm-Gg: AYBFou3AlFE65rOnUzNZdnUxJpVDWhQGWUHrLH6+tejY5X0Bb0ogvTiGU/1WhzUhiqm
	p141y7BeMqXk21OcX/lLbjMhTWf1fIKQUm/wCgmi82aL8s6pdnvlJnHx8qdGZtvCV5qnnymsOVf
	iwOyGFlHYY7m52d3iPyYNdTVPaPPC0H+4vdmoy+OYWOmcV7WRUqq6Nfck+AMQmNg+rtCjKqVKJa
	nelKxURK0WSgEqrZBh8NE9m2OETttHS2zsbyq+BaFLCYbWsgldSLeMjIbsFbjqCjT7Jx/aBwz55
	8cgNmeAV8Hqod7c4Adt0UQYjMnoIBy1TrfUsmDUGOngkFlqt8eTocYP6QV9iaTvHp5vOzWLxdQ4
	2qw61pdMMyA5p3XI88HZgOqBqD8DnTJc7pe10BNP2+TOYGM8Bh1nBPRS8L0oDz58hOXA=
X-Received: by 2002:a53:ac8a:0:b0:679:9afd:c0c7 with SMTP id
 956f58d0204a3-67ba508d24fmr864212d50.126.1793345320085; Fri, 30 Oct 2026
 00:28:40 -0700 (PDT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261014082037.1774672-1-wenst@chromium.org> <20261014082037.1774672-3-wenst@chromium.org>
 <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org> <CAGXv+5G1kgyumbj7wGf6rPFbg3spSO0zYmEkn-hZT4qUdJbytA@mail.gmail.com>
 <03375a31-0ac6-47a4-b0dc-6327080e1622@linaro.org> <b4c0761b-34f2-42ad-97e7-ab34ae776281@oss.qualcomm.com>
 <8d4d3ec2-3c97-4a46-97f8-048fdf81b853@linaro.org> <CAGXv+5G_ig=k-eH8Cp0ES70WxTHcBS2TVj9VmHaG9caROiAuQQ@mail.gmail.com>
 <8ceba969-91d2-4b43-81d0-b26e7139664b@oss.qualcomm.com>
In-Reply-To: <8ceba969-91d2-4b43-81d0-b26e7139664b@oss.qualcomm.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 30 Oct 2026 15:28:28 +0800
X-Gm-Features: AclHuK87PpF6mvOIXqHCbuY1WKimiNRH2tQGnceMsfo-UR5TI782gxdvYJm286Q
Message-ID: <CAGXv+5GFogx_kS=N1t8-SFTp+HyxLtoHzhnL6t8Zn0GBiqMoKw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port numbering
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Minda Chen <minda.chen@starfivetech.com>, 
	Shyam Pandey <radhey.shyam.pandey@amd.com>, Wei Yang <yangwei1@eswincomputing.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Hang Cao <caohang@eswincomputing.com>, 
	Li Jun <jun.li@nxp.com>, Peng Fan <peng.fan@nxp.com>, Roy Luo <royluo@google.com>, 
	Yang Xiwen <forbidden405@foxmail.com>, 
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Robert Marko <robert.marko@sartura.hr>, Xu Yang <xu.yang_2@nxp.com>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Stanley Chang <stanley_chang@realtek.com>, 
	Ze Huang <huang.ze@linux.dev>, Aswath Govindraju <a-govindraju@ti.com>, 
	Roger Quadros <rogerq@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, Mathias Nyman <mathias.nyman@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 5:44=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/15/26 11:00 AM, Chen-Yu Tsai wrote:
> > (Cc-ed Mathias, the xHCI driver maintainer in case I misunderstood xHCI=
.)
> >
> > On Thu, Oct 15, 2026 at 4:44=E2=80=AFPM Neil Armstrong
> > <neil.armstrong@linaro.org> wrote:
> >>
> >> On 10/14/26 18:36, Konrad Dybcio wrote:
> >>> On 10/14/26 11:44 AM, Neil Armstrong wrote:
> >>>> On 10/14/26 11:29, Chen-Yu Tsai wrote:
> >>>>> On Wed, Oct 14, 2026 at 5:28=E2=80=AFPM Neil Armstrong
> >>>>> <neil.armstrong@linaro.org> wrote:
>
> [...]
>
>
> >> How about the USB4, does it use the USB3.0 port ?
> >
> > I'm not familiar with USB4. A quick search says that it can tunnel
> > USB 3.x, DP, and PCIe, and it doesn't have its own USB HCI defined.
> >
> > So I'm thinking the USB4 controller would be more like a nexus node
> > or multiplexing node, or perhaps like a USB C connector. It has input
> > ports for all the protocols it can tunnel, connected to their respectiv=
e
> > controllers (XHCI, DP, PCIe). The binding probably would be very messy
> > if one controller supported multiple outgoing ports, as each downstream
> > port has a 3-to-1 relationship with its respective upstream protocol
> > interfaces.
>
> Yeah that is more or less it.
>
> There needs to be a connection between the USB4 router and the native
> (USB3 *port*, not hub | PCIe *port*, not RC | DPTX) protocol adapter
> where the tunneled packets end up at to create a PM devlink between it
> and the USB4 router.
>
> ACPI does that by adding a `usb4-host-interface =3D &reference_to_router`
> property, for DT that's still undecided:
>
> https://github.com/devicetree-org/dt-schema/pull/196
>
> As far as the Qualcomm implementation goes, I was hoping we could
> go forward with base1 numbering as the DWC3 is an XHCI controller:
>
> https://lore.kernel.org/linux-usb/20260929-topic-dwc3_tunneling_state-v4-=
0-63e296346d57@oss.qualcomm.com/

I don't have DWC3 manuals, but assuming its internal numbering follows
that of XHCI, you can't just use "udev->portnum - 1" in patch 4. That
is the logical port number on the root hub.

Instead you need

    raw_port =3D usb_hcd_find_raw_port_number(bus_to_hcd(hub->bus), port1);

to get the 1-based port number for XHCI.


ChenYu
