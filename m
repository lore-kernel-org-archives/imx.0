Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D9D3CCA11
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 10:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780482527; cv=none; b=W0cRxVpfzZNK48L2qxB84MDM8y4Xa8SFybVNpX/LpRJq5z4Ms/PLAyq8/4kcuAG5o3P029wV1ROTCN0z9nO5m91J1bZf2PmhrxAaIW96HmgcADv9OmG/p5y0q0EN/Ebu77f/A52qX3bbv5jgD7gJBvxkAUTBI4s6/ZaRDwZ6fIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780482527; c=relaxed/simple;
	bh=1KMiOis/bLdEHRWDkIcCxP1fVnp/dYeFCQreZ5iyUms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EmYdz6WNCWEeEJCVVl4UEChuwKuk9LmhXlzOheoVK8bj4a+SWfZS2FNtbOuXa6Q3sOUfS0Ss5bpmhqICz4S/RtLEHvYyPtE3++DmXOHLvvAm3RiViVUzauPQ8Av2lZto6B4W8g89oMm8t4UcvrtE34tLMiVfYYar3vL9f4mtSXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AVCa/YXt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AVCa/YXt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780482525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mVdTuQdmZHYEnxjt/VTYFuuNhfhMD/0cQDhgpbVYh54=;
	b=AVCa/YXtAkxXUC5wS8FFD3mEtw9e8M1ocj4tKe7kBCFlOZhDcybRK7PZE2zUMOjhcv6teu
	DgWKo90ZidjMGo6qqLOijVubW+Av0sCOVRNCkQK6PV+nE/4eNxtE3eWU759dEruQdy81uU
	w00iTjfBDL5i+7vFRcL9Q5NNttFA3k8=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-164-eAqlfHvLMxCl-m4YMQGZQQ-1; Wed, 03 Jun 2026 06:28:42 -0400
X-MC-Unique: eAqlfHvLMxCl-m4YMQGZQQ-1
X-Mimecast-MFC-AGG-ID: eAqlfHvLMxCl-m4YMQGZQQ_1780482521
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-39666ef4254so4136131fa.0
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 03:28:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780482521; x=1781087321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mVdTuQdmZHYEnxjt/VTYFuuNhfhMD/0cQDhgpbVYh54=;
        b=Wvcqm+XpHawtawUPvJh1BGfZetiIISlewX9EmUCqbFZsioNvwNuT/rLK3H8xeGfvyf
         /p+YLgJR9bycCuRybJ27sGFqcAn2XDylgxAplNBz/Sk6XssNGEPmjR1aRcfZHzlW7yGm
         6lnO4NigOXId7HzXT1CBj4g2ud13hE/gVIAyhfnWZMuoKCdbaBWDtgq4p27xqgQybYR5
         bVjvIvdkmZh/ZJ6I8HgSXfd/IL+9EBlQ25LruJsQ3MDDhUER6AnFm9htixcaA+vIWgbe
         +j4vxSuYEzQ9eKqqJpfsly2SK3Ci9uK29/wUo/jWEX2v9v9hir1XZVG26T5T7ZTxXRPg
         FUgw==
X-Forwarded-Encrypted: i=1; AFNElJ9qy0VLo5jasQ4siMUxdIL3QfA3pKDHBFkQdNhfEPL9iNvBBPVI/z9fPiaKbCEp22Pmd94=@lists.linux.dev
X-Gm-Message-State: AOJu0YwuwtXtcL1wXUj9prK+J8j/YxDvYCnGfgyn43G9OxEoVWR4itMk
	OpT0HiA+OCfUOVfydNZVMc2l5Tss/nU9ZtPoUHP+bnpY55yK2vhJjTAP5YFJYvzPPIaiDvT7dd5
	RhmGn0K9uW4kEb0c+cJ+6n1twfaXru7xdfJzWYjWYHg3zu0neW/qqGiLiAopbfXuF3lTigXiZFi
	IRzRX1+5T3KJ84Qe7WS3ouhGfOB8Ii
X-Gm-Gg: Acq92OGeK2obYozbeKYZ7rhUD1taxNG55NnHGS6UHHuyf8fMNov22RYeq0gkWvfv2jq
	efR9TCaiblL1IsbGfMwyVRyoYTnYnSjGTwf2qVEk1KG1Ste025bidnG/Q/B073g2Kwe4v67/ai9
	ns48R+PFdJK/97lWa5qlWdcpwGZmHrDYr/2mr2qS+gfGKqGY+IrOG7qathZDmJb02D5AMqDZ67I
	QRhpPXxehd8/+to
X-Received: by 2002:a2e:a378:0:b0:38d:fae9:9aa2 with SMTP id 38308e7fff4ca-396ac1f98dbmr3702111fa.1.1780482521037;
        Wed, 03 Jun 2026 03:28:41 -0700 (PDT)
X-Received: by 2002:a2e:a378:0:b0:38d:fae9:9aa2 with SMTP id
 38308e7fff4ca-396ac1f98dbmr3702051fa.1.1780482520475; Wed, 03 Jun 2026
 03:28:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260603071342.641874-1-ciprianmarian.costea@oss.nxp.com> <20260603093941.ysev5do557hy2rui@nxp.com>
In-Reply-To: <20260603093941.ysev5do557hy2rui@nxp.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Wed, 3 Jun 2026 12:28:28 +0200
X-Gm-Features: AVHnY4K243RGdZFkCQVWXj6BAHeNzA4KK32K9WJ-HAOfKjnlZ8EVyBxG-YNveZ8
Message-ID: <CALE0LRuqZhm03QbYg-ZOJcKe0XqCLqVZ8j-4o07QuBF-OqX9BA@mail.gmail.com>
Subject: Re: [PATCH RESEND v4 0/8] can: flexcan: Add NXP S32N79 SoC support
To: Bough Chen <haibo.chen@oss.nxp.com>
Cc: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>, 
	Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Eric Chanudet <echanude@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MjAwVburTITt4Pr3mDabcJlvKn1FPrwYpAv16PuSTE4_1780482521
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ciprian,

Sorry in advance for the noise, for some strange reason I didn't get
or find the cover until now, so I added my tested patch in 1. Doing it
now properly.

On Wed, Jun 3, 2026 at 11:44=E2=80=AFAM Bough Chen <haibo.chen@oss.nxp.com>=
 wrote:
>
> On Wed, Jun 03, 2026 at 09:13:34AM +0200, Ciprian Costea wrote:
> > From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> >
> > This patch series adds FlexCAN support for the NXP S32N79 SoC.
> >
> > The S32N79 is an automotive-grade processor from NXP with multiple
> > FlexCAN instances. The FlexCAN IP integration on S32N79 differs from
> > other SoCs in the interrupt routing - it uses two separate interrupt
> > lines:
> >   - one interrupt for mailboxes 0-127
> >   - one interrupt for bus error detection and device state changes
> >
> > The CAN controllers are connected through an irqsteer interrupt
> > controller in the RCU (Resource Control Unit) domain.
> >
> > This series:
> >   1. Splits flexcan_irq() into dedicated handlers for multi-IRQ platfor=
ms
> >   2. Adds dt-bindings documentation for S32N79 FlexCAN
> >   3. Introduces FLEXCAN_QUIRK_IRQ_BERR to handle the two-interrupt
> >      configuration
> >   4. Adds S32N79 device data and compatible string to the driver
> >   5. Adds FlexCAN device tree nodes for S32N79 SoC
> >   6. Enables FlexCAN devices on the S32N79-RDB board
> >
> > Tested on S32N79-RDB board with CAN and CAN FD communication.
>
> Tested on imx95-19x19-evk board with CAN and CAN FD communication. No iss=
ue found.
> This means this patch set do not impact the original platforms.
>
> For this patch set, feel free to add tag:
> Reviewed-and-tested-by: Haibo Chen <haibo.chen@nxp.com>
>
> Regards
> Haibo Chen

Tested-by: Enric Balletbo i Serra <eballetb@.redhat.com>

Tested on the NXP S32G399A-RDB3 with loopback and high-rate traffic.
No regressions observed:
  CAN frames transmit and receive correctly, with no duplicates.
  Frame reception showed no errors during stress testing.

Regards,
  Enric Balletbo

> >
> > This is a resend of v4 with no changes.
> >
> > v4 -> v3
> > - flexcan_chip_interrupts_enable(): disable/enable all IRQ lines
> >   (not just dev->irq) during IMASK register writes
> > - Split rx/tx masks per mailbox IRQ line (struct flexcan_mb_irq) so
> >   each handler on S32G2 only processes its own MB range
> > - Added received Acked-by tag on DT bindings patch
> >
> > v3 -> v2
> > - Split flexcan_irq() into dedicated handlers (flexcan_irq_mb,
> >   flexcan_irq_boff, flexcan_irq_berr) to fix duplicate event
> >   processing when multiple IRQ lines run concurrently (new patch).
> > - Added flexcan_irq_esr() handler composing state + berr for S32N79
> > - Ordered quirks used by s32n devtype data by value.
> >
> > v2 -> v1
> > - Renamed FLEXCAN_QUIRK_NR_IRQ_2 to FLEXCAN_QUIRK_IRQ_BERR to better
> > describe the actual hardware feature
> > - Appended new quirk at the end
> > - Switched from platform_get_irq to platform_get_irq_byname usage
> > - Updated interrupt description in dt-bindings
> >
> > Ciprian Marian Costea (8):
> >   can: flexcan: use dedicated IRQ handlers for multi-IRQ platforms
> >   can: flexcan: disable all IRQ lines in
> >     flexcan_chip_interrupts_enable()
> >   can: flexcan: split rx/tx masks per mailbox IRQ line
> >   dt-bindings: can: fsl,flexcan: add NXP S32N79 SoC support
> >   can: flexcan: add FLEXCAN_QUIRK_IRQ_BERR quirk
> >   can: flexcan: add NXP S32N79 SoC support
> >   arm64: dts: s32n79: add FlexCAN nodes
> >   arm64: dts: s32n79: enable FlexCAN devices
> >
> >  .../bindings/net/can/fsl,flexcan.yaml         |  30 ++-
> >  arch/arm64/boot/dts/freescale/s32n79-rdb.dts  |  12 +
> >  arch/arm64/boot/dts/freescale/s32n79.dtsi     |  50 ++++
> >  drivers/net/can/flexcan/flexcan-core.c        | 249 +++++++++++++++---
> >  drivers/net/can/flexcan/flexcan.h             |  12 +-
> >  5 files changed, 316 insertions(+), 37 deletions(-)
> >
> > --
> > 2.43.0
> >
>

