Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD03427FB3
	for <imx@lists.linux.dev>; Thu,  6 Aug 2026 09:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786007404; cv=pass; b=dsqMDxPazeQf5lj2H30itAIVjYz8Q6dpoMPvoPlUcobjUkF6IPxKVM6feXSHpqokTwOXWxpix0nuxj2MPmuCym3sWuTsaYhJ+H8LFouva+P229/ZKhVKFuRKsdcS0ILZUrnAsxZRJQgfgCskslKW9P5K3K4Uz1Qsy5PTM9j0xyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786007404; c=relaxed/simple;
	bh=PjgzYh4xhi8r/1gtDSs2lcpXDwHgzvW8vY7tDCqm8d4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u99osJP9xyA9boAnboYDztWzyIv8Ps1x7EOV/BU4/BmyTiDAi8a5V6Vhnav6FUfVQzSV4jCNiJxflSFQ+7HSBJNcphCQo0dcxgyxC5BCLKFsxRtkmtirbmRu0/2E25LgZjMItXhMt2dlMKp5O5jw34J+hhi0ql5jHV2ZoTwU27g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y/dzcmQK; arc=pass smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y/dzcmQK"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6ac83a09781so382701eaf.1
        for <imx@lists.linux.dev>; Thu, 06 Aug 2026 02:10:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786007401; cv=none;
        d=google.com; s=arc-20260327;
        b=LhIBd37Ny9SCX2tAjI/VfZxcACvO3BOJjZt/saDgfVeg3i2dzNnC24/x0m4XdOcsvh
         N0E6jcIGRbir5mSTFD4qNYSEtBVRgkt/swaNBbdq2dVjQt18w0ZyTDHj6yRQVWu209e7
         6TLYvqdzdRTe3uXVxiVrF8I2/9kB7icoevIiHADppnWcTeDnJc67aFA6LgUVVsfAr2XD
         wpnNaJW9rTvoambFAUjNOiKTscDERTl++42O4wb/gruXdDI/d0zQPWt5oBam+e8jFYgV
         W4rZopQyXwcChkOW+Kvhv3fGnzrtZH16L3pN2LyNwl9m24A3Fj+wm59l0wynX4XiotjL
         Hxiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O63QlgegA4Mm6qi4a1gFdlgc0IoabcGZvqlXlfGAHy0=;
        fh=YP6EAh1+Nu9XyU33NB9kuXb1C0dIFZhX1wQZkwktn7w=;
        b=Ie879O2EG9+vAcfIRAKJFFKzJkZIhCkIE8jZg2Qk7UH2fo4weX1tXgBYvIM66HGQjr
         fA0fkKhB4cT/t5+Au+vze4o3RHxB2bRIwvO/pF+a3MSB6XlzTPnnDcHt/vnaNonkC1ER
         0pk+qVPuv9i1STt4RXla+PNeYVll51dA6beHtIzi1gJt5dWWZius5Os41BToEvKZ/D0y
         r5t/a83NgzYbJUJ+2S3ev7vGbQX0Jwq21l/x6m/yCAVYRpg5+asK8Vm1bvrauqCT/iBe
         aRSghgbMmioTvKDgoLeWrQLucnCaGjrxI/0mp6T1ZgaEqNLFNP8EvuLjAHgOV4UgaO6N
         QYFw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786007401; x=1786612201; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O63QlgegA4Mm6qi4a1gFdlgc0IoabcGZvqlXlfGAHy0=;
        b=Y/dzcmQKk3I/ZADJaOq8Em5Hyq14W/dG/kZPy6MpQQj8azTxPqcZ0Yx+8zrJYpxheZ
         GogRePWJpI2nLgc4jQOORe6yt4Yos5A2kvp9v+642ECtecalaTlaXI7tiLqTZCTcoQwU
         18RK0lPXTU2Ko0IKVi5/Wiyo+BqBUGooIiJ9tMGY2cmk7BGxz2nJt/yMsT8qmzSXNBxv
         0wPpKjOrcjnDSP/3AhWJlQCR1qWLPTFx3rtwZifoDvSkoOBycBpkw/sEUitsbRQgmfmX
         o67m6WhMxLbsEiQKGdyYEvIGJDdNL1ohftpnAmwGhx5LSdAuozmV/JXfm6z9nW9vsVfu
         R7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786007401; x=1786612201;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O63QlgegA4Mm6qi4a1gFdlgc0IoabcGZvqlXlfGAHy0=;
        b=XHZ1oTL5Bub/THqfhwOTzqOp5vZs5T2wn8mV/ruUwtB/KOzIlegoHEFVih/hdOlss+
         7+ocbMLKI9uR0yk53tf7Nq6C5QVC1SUe4SMkLa+X71+lo/QS5YdFeIrLTiiJqRrXduUo
         s/IMXTb4TGCEg6s/KHOPWi+hKpnDvj9UF0S3OZ6sZGC7Y9655BBfGj3vDaoCNvQoUjyM
         rmIL4BSoJBVVvG7Ml7dO/fGlL4SrzZfPV4b225fiF8C89esHHJc6gAy1oDVCoClG/PnJ
         dtLOx6exgfYbb6MChN0YXSLocgAJ1O14SKaem9Mfi9V7BS6EF5KDe9AGy862vUg/CsST
         PWng==
X-Forwarded-Encrypted: i=1; AHgh+RrLDZx8QE2+aqECyQ2MRxRxQlU0oRyICEjtWE+uwS/80pi0XFB0W8ZILJ11hMTbY7UGJYQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQfxFyzKwoUiNjfv/a6lMfNe9NVsQeSCRz7apEvx7pv1Oe7TXt
	nOYP3PlWfnja98a0bUWLNW0W76bACk7/9saHhPBKemc0sufiPINbU2e35+ayh+KBlRMd7Qu396y
	FT4LdzF/bDWAkUoOOZUU7AKNg2FjufDkXPFXQ23wEyDLgcO1PN9Y/ifatlIk=
X-Gm-Gg: AR+sD10DznRlmqA4NDydA0xcwWXXHJNZkDzutsacier7xoEnNlcB2/uR0MXzENW1+tz
	IY2OyTodwfR9Fc7HiF+4MSEbohhh/lyDpsAeHeXLPyOytTuHkswUWJCUQRMa8SRs1WXNU6XcznT
	kV9dyTCWyiIJhDwHmT4l5cFvYj0vUdMzBQBCVEu9BBaWXKOe4I1QN/eBkj+4qsP4uI0WVlqkhKe
	i7fyEC0Q8Jy//HmdV4LYZ9sqsL2Auluc9C+xCblX5/wafl639Kww/YoISjXnpBfSbwX1LWG11D+
	C++DPZfRdx0c85duQlxH1NB4pF7uUrsemRx3QMXVKzxNSxjOK84UN6qxEFfnfbPGWa82omY2UFb
	ynA==
X-Received: by 2002:a05:6820:4cc1:b0:6ae:33ee:7ae0 with SMTP id
 006d021491bc7-6b016dd4870mr1350572eaf.15.1786007400738; Thu, 06 Aug 2026
 02:10:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260723104614.3717623-1-xu.yang_2@oss.nxp.com> <anMRbinFAZ668Rpm@black.igk.intel.com>
In-Reply-To: <anMRbinFAZ668Rpm@black.igk.intel.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Thu, 6 Aug 2026 02:09:24 -0700
X-Gm-Features: AUfX_mxlGsjUiMkRPJa9RiotkdNP-jSL7K4c3X_aw86ypmvYQHzpAMuEsImXUsg
Message-ID: <CAPTae5LkT5EqCi8w4oTRNxX9oWdi4eovZ41u7LMGrG=64ocJUw@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: tcpci: pass correct rx_type to tcpm_pd_receive()
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Xu Yang <xu.yang_2@oss.nxp.com>, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 3:33=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Thu, Jul 23, 2026 at 06:46:14PM +0800, Xu Yang wrote:
> > From: Xu Yang <xu.yang_2@nxp.com>
> >
> > Previously, tcpci_irq() always passed TCPC_TX_SOP as the receive type
> > to tcpm_pd_receive(), ignoring the actual frame type reported by the
> > TCPC_RX_BUF_FRAME_TYPE register.
> >
> > Cache the TCPC_RX_DETECT register value in rx_type_mask variable. When
> > a PD messageis received, read TCPC_RX_BUF_FRAME_TYPE register and handl=
e
> > the message only if its frame type is enabled in mask.
> >
> > The TCPC_RX_BUF_FRAME_TYPE register records the received message type,
> > which has a 1:1 mapping to enum tcpm_transmit_type.
> >
> > Fixes: fb7ff25ae433 ("usb: typec: tcpm: add discover identity support f=
or SOP'")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>

>
> > ---
> > Changes in v2:
> >  - add fix tag
> >  - check return value when get RX SOP type
> >  - pass all possible RX message type to tcpm_pd_receive()
> >  - cache TCPC_RX_DETECT to filter out unallowed RX messages as suggeste=
d by Badhri
> > ---
> >  drivers/usb/typec/tcpm/tcpci.c | 12 +++++++++++-
> >  include/linux/usb/tcpci.h      |  1 +
> >  2 files changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tc=
pci.c
> > index 7ac7000b2d13..6717ac914c6a 100644
> > --- a/drivers/usb/typec/tcpm/tcpci.c
> > +++ b/drivers/usb/typec/tcpm/tcpci.c
> > @@ -38,6 +38,7 @@ struct tcpci {
> >
> >       struct regmap *regmap;
> >       unsigned int alert_mask;
> > +     unsigned int rx_type_mask;
> >
> >       bool controls_vbus;
> >
> > @@ -488,6 +489,8 @@ static int tcpci_set_pd_rx(struct tcpc_dev *tcpc, b=
ool enable)
> >               if (tcpci->data->cable_comm_capable)
> >                       reg |=3D TCPC_RX_DETECT_SOP1;
> >       }
> > +
> > +     tcpci->rx_type_mask =3D reg;
> >       ret =3D regmap_write(tcpci->regmap, TCPC_RX_DETECT, reg);
> >       if (ret < 0)
> >               return ret;
> > @@ -749,6 +752,7 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
> >       if (status & TCPC_ALERT_RX_STATUS) {
> >               struct pd_message msg;
> >               unsigned int cnt, payload_cnt;
> > +             enum tcpm_transmit_type rx_type;
> >               u16 header;
> >
> >               regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);
> > @@ -773,10 +777,16 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
> >                       regmap_raw_read(tcpci->regmap, TCPC_RX_DATA,
> >                                       &msg.payload, payload_cnt);
> >
> > +             ret =3D regmap_read(tcpci->regmap, TCPC_RX_BUF_FRAME_TYPE=
, &rx_type);
> > +             if (ret)
> > +                     return ret;
> > +
> >               /* Read complete, clear RX status alert bit */
> >               tcpci_write16(tcpci, TCPC_ALERT, TCPC_ALERT_RX_STATUS);
> >
> > -             tcpm_pd_receive(tcpci->port, &msg, TCPC_TX_SOP);
> > +             rx_type &=3D TCPC_RX_BUF_FRAME_TYPE_MASK;
> > +             if (tcpci->rx_type_mask & BIT(rx_type))
> > +                     tcpm_pd_receive(tcpci->port, &msg, rx_type);
> >       }
> >
> >       if (tcpci->data->vbus_vsafe0v && (status & TCPC_ALERT_EXTENDED_ST=
ATUS)) {
> > diff --git a/include/linux/usb/tcpci.h b/include/linux/usb/tcpci.h
> > index f7f5cfbdef12..9b46a6bc762c 100644
> > --- a/include/linux/usb/tcpci.h
> > +++ b/include/linux/usb/tcpci.h
> > @@ -144,6 +144,7 @@
> >  #define TCPC_RX_BUF_FRAME_TYPE               0x31
> >  #define TCPC_RX_BUF_FRAME_TYPE_SOP   0
> >  #define TCPC_RX_BUF_FRAME_TYPE_SOP1  1
> > +#define TCPC_RX_BUF_FRAME_TYPE_MASK  GENMASK(2, 0)
> >  #define TCPC_RX_HDR                  0x32
> >  #define TCPC_RX_DATA                 0x34 /* through 0x4f */
> >
> > --
> > 2.34.1
>
> --
> heikki
