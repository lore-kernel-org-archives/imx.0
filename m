Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722124315F
	for <imx@lists.linux.dev>; Mon, 18 May 2026 14:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779113662; cv=none; b=LoOut2heEGAzXIE2q7fwMmSmp/ubQP3b/IYWa4mpS+zgHM3vXiv55tHdpwIZ9pJRpv8KI2oNDr9FpCXfolkYdetcQrPwJOVGGHWGefLjGSomu4oYKnPNNlzCSH/XaFsUOtGMgzkEQi09O253gNuG00cmdkxzmdKwEqjSa7teN8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779113662; c=relaxed/simple;
	bh=5qDpVkMt4wmJAuvajXr0K3vaIjTuOXwvJrhqj7SsGUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B7DnTaDKhzt3KBNe8BC7U9CTlSPmR2h+T0rSlKWaI4k9Q2/75sYxcQLacPL4TUXfmVUfgzi3bAdo820tYVEvElTn2Rgp7tDO5AnMfazLBLk2XRGra/s6eL+jmLcG7Yg61CL3Ptr5D8k+6OVnyGhTfDPj5k3VFFtldNnOwcV539A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XcCKlePQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XcCKlePQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779113660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X0PKPpLFUcJ5PNICdj+fODP+ieu23TytLui2uhS6hnY=;
	b=XcCKlePQRCeNFJsGcLMSHXQ/fSrJvamD5A2GxmWdoGZQL/RrWD2lyIlTxFTNF9BMo6BpbY
	w0/EpsruSfyA3I1DLVcmyCwiy2DO/qTcIZpk/Bm8sU+YKDkio4I76oPJ2p6UBwLkGoA+Yp
	a20GsbyKFpt8c+g3HBJT5doI0gxJFyA=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-mU3r8NGHM7KTOA_cPFPwRQ-1; Mon, 18 May 2026 10:14:18 -0400
X-MC-Unique: mU3r8NGHM7KTOA_cPFPwRQ-1
X-Mimecast-MFC-AGG-ID: mU3r8NGHM7KTOA_cPFPwRQ_1779113656
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5a870f93c99so207036e87.0
        for <imx@lists.linux.dev>; Mon, 18 May 2026 07:14:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779113656; x=1779718456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X0PKPpLFUcJ5PNICdj+fODP+ieu23TytLui2uhS6hnY=;
        b=d8etaDGqSj4x9sLYzNT2h18RBprxPH6Yg+hMUtLQ/GuyZXh4YHrIiQUAal/tVkgduJ
         0egW/YLEJUP9b9DCoHewT64KUhwQUZT4ff6fq913EXGmwwn2qd5KNdhxDwjs4q9UP8/N
         hoZ83Nb4Em+oouxGEE5PyFUPVW4VatJUE8V4ktBTI7vqKb2uzUy8DDVwIS6xgZlHX0NN
         9hDEINdJGeDy6MeZ8Y6bRuu5eQ6/8T+fPB2ia5z4Pc5znmKHGjSTYxHESEboVD4tZ9ja
         i+x/8L4HlrPy4L6xI8MkJrbysWpiX/mu3pzmypYmJsv7lffg7qPDjUHlXc2EkpTaGEtS
         soiA==
X-Forwarded-Encrypted: i=1; AFNElJ8MjCxD3f0WawkSoGE6P8xI/JBWbni+BNTm2XiCgx+7d+H6SC63PSsChYzGwY7787eQ7Ug=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZZzblOeNFwnGMd1rSoj6YdfmJ9iUJX/jlpZusuhKfz4QeUUBT
	v77ht4owMONgBmH4ZkgrpeMo+GNr3avufTe9YJlwIZKtksM/sY5ZYtQrAfCeLEs2vrNdglnjTrO
	UOh7BjuAh+uUWVOWdAHhMBllFTA5QyDLHQcvoHR28WKTNa3ZLdRncTnq467dTM01iZ5nh36vu2O
	wBDFFrbnGlQuC7BDb0eBJl1Xx0k0GO
X-Gm-Gg: Acq92OGrwTabVzZSCqOdqDBr2NleF1iiU4z+UeW/Py75U5gqDauV7pUvmlGc7z4qm/I
	QWHiQ/f4alJm0r5/w22W084P/3Pg+L9hcNbx4pxf2HjOy4+7nNR51gzFiFxn9OVMtSFh55HJpzK
	CCcTpypjrgzogdCIBV5d0Wmv/2AsJMhTQz0jtI18DIP1t3Q0f7ypXevYYFSTGgqeWHLwFVXigki
	TsEag==
X-Received: by 2002:a05:651c:410e:b0:38f:f6a2:a61d with SMTP id 38308e7fff4ca-39561f2f883mr11802501fa.4.1779113656355;
        Mon, 18 May 2026 07:14:16 -0700 (PDT)
X-Received: by 2002:a05:651c:410e:b0:38f:f6a2:a61d with SMTP id
 38308e7fff4ca-39561f2f883mr11802281fa.4.1779113655655; Mon, 18 May 2026
 07:14:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260216150205.212318-1-larisa.grigore@oss.nxp.com> <aaGkGwbk-sh0YJqj@jkangas-thinkpadp1gen3.rmtuswa.csb>
In-Reply-To: <aaGkGwbk-sh0YJqj@jkangas-thinkpadp1gen3.rmtuswa.csb>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Mon, 18 May 2026 16:14:02 +0200
X-Gm-Features: AVHnY4JRP0kGP-z42K5FI0qcb3gAysvgY6dzw7kUR8X3jOVZKVkXLna2nVCi7XY
Message-ID: <CALE0LRuahJy2EKa7YUukGRq1w9iws6kDvjZ7o33ahJUGc2JSsw@mail.gmail.com>
Subject: Re: [PATCH 00/13] Add DMA support for LINFlexD UART driver
To: Jared Kangas <jkangas@redhat.com>
Cc: Larisa Grigore <larisa.grigore@oss.nxp.com>, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com, 
	chester62515@gmail.com, cosmin.stoica@nxp.com, adrian.nitu@freescale.com, 
	stefan-gabriel.mirea@nxp.com, Mihaela.Martinas@freescale.com, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, s32@nxp.com, 
	imx@lists.linux.dev, clizzi@redhat.com, aruizrui@redhat.com, 
	echanude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Zu69kr7iOZTfig-aBV0lTjiO08M2Yu2aYgy1aloRwPI_1779113656
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Any chance these series can be considered? They still apply on top of
the mainline kernel.

On Fri, Feb 27, 2026 at 3:03=E2=80=AFPM Jared Kangas <jkangas@redhat.com> w=
rote:
>
> Hi Larisa,
>
> On Mon, Feb 16, 2026 at 04:01:52PM +0100, Larisa Grigore wrote:
> > This patchset enhances the LINFlexD UART driver and its device tree bin=
dings to
> > support DMA transfers, configurable clock inputs, dynamic baudrate chan=
ges, and
> > termios features. It also includes a series of fixes and improvements t=
o ensure
> > reliable operation across various modes and configurations.
> >
> > The changes added can be summarized as follows:
> > 1. Fixes with respect to FIFO handling, locking, interrupt related regi=
sters and
> > INITM mode transition.
>
> Tested this series with the default devicetree configuration by booting
> the board to a login prompt about 200 times. Without the series applied,
> I was seeing a bug roughly every 30-50 boots where the kernel would
> would hang in linflex_console_putchar() waiting for DTFTFF. In my tests
> with the series applied, I didn't see any regressions and the bug no
> longer appeared. Thanks for the fix!
>
> Tested-by: Jared Kangas <jkangas@redhat.com> # S32G3, interrupt-driven
>

FWIW I also reproduced the issue Jared faced. Current state of the
LinFLEX serial driver in mainline seems a bit buggy and I can confirm
that these fix the problem.

Tested-by: Enric Balletbo i Serra <eballetb@redhat.com>

> > 2. Removal of the earlycon workaround, as proper FIFO handling and INIT=
M
> > transitions now ensure stable behavior.
> > 3. Support for configurable stop bits and dynamic baudrate changes base=
d on
> > clock inputs and termios settings.
> > 4. Optional DMA support for RX and TX paths, preventing character loss =
during
> > high-throughput operations like copy-paste. Cyclic DMA is used for RX t=
o avoid
> > gaps between transactions.
> >
> > Larisa Grigore (8):
> >   serial: linflexuart: Clean SLEEP bit in LINCR1 after suspend
> >   serial: linflexuart: Check FIFO full before writing
> >   serial: linflexuart: Correctly clear UARTSR in buffer mode
> >   serial: linflexuart: Update RXEN/TXEN outside INITM mode
> >   serial: linflexuart: Ensure FIFO is empty when entering INITM
> >   serial: linflexuart: Revert earlycon workaround
> >   serial: linflexuart: Add support for configurable stop bits
> >   serial: linflexuart: Add DMA support
> >
> > Radu Pirea (5):
> >   serial: linflexuart: Fix locking in set_termios
> >   dt-bindings: serial: fsl-linflexuart: add clock input properties
> >   dt-bindings: serial: fsl-linflexuart: add dma properties
> >   serial: linflexuart: Add support for changing baudrate
> >   serial: linflexuart: Avoid stopping DMA during receive operations
> >
> >  .../bindings/serial/fsl,s32-linflexuart.yaml  |  31 +
> >  drivers/tty/serial/fsl_linflexuart.c          | 972 +++++++++++++++---
> >  2 files changed, 846 insertions(+), 157 deletions(-)
> >
> > --
> > 2.47.0
> >
>

