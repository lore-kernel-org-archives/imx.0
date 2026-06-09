Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13EB426D19
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 13:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781012924; cv=none; b=MVtMuykLZRvwTnOKnFdL6eiQX8sI149nhXKvRxuz+NwQYfXCfZ3VaLrdrwdsq89koD74mJ4hxeMZ+6Kn0FLFaJpjDrY+nz+BEUU5+Ui7H+Pt8oiYz28TQazUZUh+gKo0AvziPGAVqG54iYqlVDjfuxsrCZDMFK9Ttv4KnDzqSgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781012924; c=relaxed/simple;
	bh=fCYirjuwrDR66B9tbkORA630qnGzVI5sfSpUkGX5FM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QNCFyyicAfJwink+t034mYeJoU/0B5XKyxNGK8r4de+8tZUs7N8GseyAOAAJ+0OBWAmiUv84oyynvi6EVBZs+yGnCcieMZFaY48auYCRqbihWT8D/D0ArxnO6KA1SUL5zFeoRAaR65zROCRJaWPj4pd5IqPInAEnL2anCDicWII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fZUHAPFo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fZUHAPFo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781012921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B8ybc8eEm2l2UXbUIsilP7Qkz+jgaPmO0vHKofujiXk=;
	b=fZUHAPFoA4B9mmWGZFlB0BEP3Flg9+wiL+G4LLpfbhkwEZy0kfcDq3bmgdpx7/HKWb5v6T
	8/ywzTIzK0bo4ujIKZC0zu7t/EYDG5QuiL8IYwqBRsWwRIqbvBbH8yfnPDJMlhGqImYKox
	OUJWcJNM/PEdEFMk20UQMNZnAeqH95A=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-wgJ4lh2NPpi-BZceIDFSiQ-1; Tue, 09 Jun 2026 09:48:38 -0400
X-MC-Unique: wgJ4lh2NPpi-BZceIDFSiQ-1
X-Mimecast-MFC-AGG-ID: wgJ4lh2NPpi-BZceIDFSiQ_1781012917
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-3967721031cso3306781fa.1
        for <imx@lists.linux.dev>; Tue, 09 Jun 2026 06:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781012916; x=1781617716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B8ybc8eEm2l2UXbUIsilP7Qkz+jgaPmO0vHKofujiXk=;
        b=WGMYjqREqKK9NzMo8f+/nbslLq0uAXl7bPbuaK/RCpAsV7WS28Yn/cFMPmoVCHtLO7
         ZyU6CdR5SFN8ItaAF+F0hWbwkSbvjhrQqBPbYwWEB8DmNT6r88jQVgor2mKtuFNRp8yo
         qmUVjqV3u0SnUhEPYmWJY+EJMI7kOao/DePVnd5ZC948UrgI9POw3xeq2mRHHjqtVgvf
         aRoUTa88dKkZlxhCSTVjlcF6fm3xuEy7AyrELHxEKQIpI0uZ1aV5l5W+9E28JX2q/ocZ
         njWFmpPxovD/39I8EbF7nplt7zG2iskJNl3ZZlWBElz9pdLozYQm2kkYVufkaRLxvmGY
         Dirg==
X-Forwarded-Encrypted: i=1; AFNElJ/jwqhRoFQ0FeZOBWehpmB0XaQ09KXrTLqx1pmXYshrbkivilmASEeY/vaAw8kWRhr7WqI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwEdCPI3L2Yo88Arbg3fKNVUPPr8wTD1w39GB1PahEXnhfwpj9o
	vjOGE+Ui4ZpVR4yfx8DTwJbDGE410m/PXcg8HW2wDP9WJBNh6+FT8o1CxqDMr8e8HtAECBfT41n
	t0riVZWXt554j2FfcFFB4XnoIKz0XJVmgri6T39vxvmB9/tVVI+iAdSj3VpspeQctRN6LAmu8/q
	Qo6emuteSp3DyaC8LBxZyzKXZyTqqJ
X-Gm-Gg: Acq92OFFMEbZhTm+LMdPzsTcJEH0x2xsdE3waoOM9AeIstsljJx7ciEGy5NlpUdYlm3
	C46CqJ9a6R2g5HJKQyYNTEgWLXQI9yN5PhnNe6X4eT2etqs6nvCfIyWVFf9CDlpnt9nDYMInp6U
	39w0DKjIJbmp7pR33Xeyzd0HFU6VqYk3D4f9Ep5oR476vahbTpESKdf8Gk5zPCzTzBgJuUfQNBf
	LdPTmTyL8Pxwe/Y
X-Received: by 2002:a2e:ad12:0:b0:396:8d4f:573d with SMTP id 38308e7fff4ca-396d0870a2fmr26107351fa.4.1781012916514;
        Tue, 09 Jun 2026 06:48:36 -0700 (PDT)
X-Received: by 2002:a2e:ad12:0:b0:396:8d4f:573d with SMTP id
 38308e7fff4ca-396d0870a2fmr26107251fa.4.1781012915884; Tue, 09 Jun 2026
 06:48:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260520151007.4193688-1-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260520151007.4193688-1-khristineandreea.barbulescu@oss.nxp.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Tue, 9 Jun 2026 15:48:24 +0200
X-Gm-Features: AVVi8CeBgvu_FxTeu_WpMekXBVDp5tn5JH9vmX9Kfgdgwq-5WsR-GNlc1P-phzU
Message-ID: <CALE0LRufn_ZRtscVxoZkHdNFdjWpyBeRkeongDRE8NGmPCskJA@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] add USB PHY node and USB OTG pinctrl support to
 S32G2/S32G3 SoCs
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VMUd02PbseQbVbgdFr_UmDaQ1XEJ-Gq2x2O9_SYLAso_1781012917
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, May 20, 2026 at 5:10=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:
>
> This patchset aims to add two changes to the S32G2/S32G3 dtsi support:
> - Add the usbphynop node for S32G SoC based boards
> - Add the usbotg pinctrl support for S32G SoC based boards
>
> v2 -> v1:
> - use hyphenated naming for USB OTG pin groups
> - replace deprecated 'fsl,usbphy' with 'phys'
> - move 'usbphynop' node to the SoC-level dtsi
>
> Khristine Andreea Barbulescu (1):
>   arm64: dts: Add usbphynop and usbotg pinctrl for S32G platforms
>
>  arch/arm64/boot/dts/freescale/s32g2.dtsi      |  7 ++-
>  arch/arm64/boot/dts/freescale/s32g3.dtsi      |  7 ++-
>  .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 46 ++++++++++++++++++-
>  .../boot/dts/freescale/s32gxxxa-rdb.dtsi      | 46 ++++++++++++++++++-
>  4 files changed, 102 insertions(+), 4 deletions(-)
>
> --
> 2.34.1
>

I tested the bindings on my S32G-VNP-RDB3 board by connecting
different devices (mass storage, mouse and
keyboard) in host mode and got them working, so

Tested-by: Enric Balletbo i Serra <eballetb@redhat.com>

[   32.957280] usbcore: registered new interface driver usbhid
[   32.957285] usbhid: USB HID core driver
[   39.683065] usb_phy_generic usbphynop: dummy supplies not allowed
for exclusive requests (id=3Dvbus)
[   39.945747] imx_usb 44064000.usb: No over current polarity defined
[   39.999412] usb usb1: New USB device found, idVendor=3D1d6b,
idProduct=3D0002, bcdDevice=3D 7.01
[   39.999422] usb usb1: New USB device strings: Mfr=3D3, Product=3D2,
SerialNumber=3D1
[   39.999429] usb usb1: Product: EHCI Host Controller
[   39.999435] usb usb1: Manufacturer: Linux 7.1.0-rc4+ ehci_hcd
[   39.999440] usb usb1: SerialNumber: ci_hdrc.0
[   40.575296] usb 1-1: new high-speed USB device number 2 using ci_hdrc
[   40.747558] usb 1-1: New USB device found, idVendor=3D0781,
idProduct=3D5567, bcdDevice=3D 1.00
[   40.747578] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[   40.747585] usb 1-1: Product: Cruzer Blade
[   40.747591] usb 1-1: Manufacturer: SanDisk
[   40.747596] usb 1-1: SerialNumber: 4C530001310712110235

# cat /sys/kernel/debug/ulpi/ci_hdrc.0.ulpi/regs
Vendor ID Low                24
Vendor ID High               04
Product ID Low               09
Product ID High              00
Function Control             40
Interface Control            08
OTG Control                  27
USB Interrupt Enable Rising  1f
USB Interrupt Enable Falling 1f
USB Interrupt Status         04
USB Interrupt Latch          0c
Debug                        00
Scratch Register             00
Carkit Control               00
Carkit Interrupt Delay       00
Carkit Interrupt Enable      00
Carkit Interrupt Status      00
Carkit Interrupt Latch       00
Carkit Pulse Control         00
Transmit Positive Width      00
Transmit Negative Width      00
Receive Polarity Recovery    00

# lsusb
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 0781:5567 SanDisk Corp. Cruzer Blade

Cheers,
  Enric

