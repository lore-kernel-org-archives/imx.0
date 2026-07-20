Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125DD3F39F8
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 11:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784545841; cv=pass; b=cPSLM3pT9z4ehqPEgWn1YdEtimf0OC2DhpEk9+o35lLBrWBz8MxuATgTEyIvX5W5/4igZYYWd6L/apQNDvw748pd7HK6i+LoBP+Z10fRl++Ox8Pp5JIHEx1KZVQuazuntrYpSmxyufAVjnwG185UK6ZXGTSE8GlNcg8k6YFY5n8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784545841; c=relaxed/simple;
	bh=UKngneTFPXF8poS1q5fNtashfeg8DcKeJ6OYgfoXl7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OudPVV+6hmS/ktEtuNluQJPvqsPg2vl2UAdAcJUaBemklFKXahNjoqrgScR/oYdadVNiLGIgjFMgmseu7EfFn90mx/TVoe8NisnlEpIZpojL6dhEwizEy4cwOLVoMM7b2oP4VwHpYV2TvTytCGip4NrWV25621N/WRsvbbaP1Dw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fpalaMOZ; arc=pass smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fpalaMOZ"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-456f7012050so585781fac.0
        for <imx@lists.linux.dev>; Mon, 20 Jul 2026 04:10:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784545837; cv=none;
        d=google.com; s=arc-20260327;
        b=KrYBC/TFuaboH3skj68cXqjuT0ybO2NWQp6qYfbAp1dbdwZQAC9S5gdIc/mKSX+Gy6
         fC523qWkWk5cNdkaQfrhzh/MFjYL4UASIcsmhRdZCu0MvQBKoQTDrZjQVbd30P50sP1m
         Qr057Rdi+/JjenjOJH3Nkp0HAhlUD+AWcoSSYWP0p+XuVM3va3lpiNjk5nXvoGo34ZoB
         3eo8jUD8fVT6NbPnB0ttAzZflzyP3kh5ElETbmJKwdYdeSp6d/HcKbtwfluUgY1sx7ow
         bLA0AtbLZkB18oxzql+AuBObSuDkRAilwpmcwuJy8tGDyxsyjMGPFqOsNpivnliUlovj
         ew6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q4iy5g0+ixbzL2cCTufEUXDAeXZcr26NvjHxO5tS93Y=;
        fh=c/O4SMYc0lnEcJS1PiRAXIXisycmpc7x1jzDcnm6AYU=;
        b=raUEIoPmIFR5QH9IVNgXdgU67oac8rjM1w4PfTlYezUBi55MzkQEqrNRJuy9XNBiPt
         +9PJbmoTgpJb7vImpJd7o6jZYCXv7zG1/o5WlbngJabp8LJwkkdoJ7m07Pp9siII+ngT
         +ntuCedhOCyzW27hEKfRLEXZVbJ+yI+o7Y0Fffkeu6iGOU1+fBGcG7OdOFjNvD5zOU0h
         4SCuZiXzThEDH2fW+TH/7d7av4Y/3/UnP36zv374wO7Bdl1skSKlALfttvWa0hFdnWEZ
         ZNK4K/5ymWm3VAzCAAFQnaPPXuKk4oERUQxmzTLqv7crvqO3UEP83mwiNGjxBj7yVFo4
         PIUw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784545837; x=1785150637; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q4iy5g0+ixbzL2cCTufEUXDAeXZcr26NvjHxO5tS93Y=;
        b=fpalaMOZc1e4mzTh+1skaQ4RaQuxleqWGaWhRaZVuD81BVZmwePgPVTZ/Utm0VnlP8
         QhX1/GWOO6/YSKixwN18Qf9IJ2kGVdEgKKi65cu1Ckt8HnbHshBQWHaCefTV5GiGbyG4
         tkjXgi6ckYrC2bwdOkNzRTBr7NhGv4O4Hs1j2ImMU07brfaKvK+IySEy/QHPt9H4SsG0
         S5MIWOTTQqh8qw8Nh672OSatRBluYQU/oyTz2A/FpfFHYUHdCbD5sEPB9W67hLL/6FLJ
         3P0xfXtpxXCqabUIe0Q3Efc0x6v8jPHsnSPfW6HBNg/MrwOp4A3kA0kdNcRp/FPCod6I
         UrUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784545837; x=1785150637;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q4iy5g0+ixbzL2cCTufEUXDAeXZcr26NvjHxO5tS93Y=;
        b=UM9h1dkHSZ1E1QFh44cCw3yPJxSIqqMj+j8oJvXHe4OO+BT027Ff4VGTrbenJ5XeKW
         ZMSasActHjK/lci8nnHzxSS85jrKc+A4tZQxCJHsp7iYcg1KI/Elyili/2pxbDl3+D8f
         aaJhTQLXXHt3oVulqHaml+8HJTVUmkAdj2rd+JWF7O4lVK2cvLk2wzrDJXIcExzGspof
         rRNr6M/x360CQu0PMisaJmbVjZL48GjzFOtgRydBKYZyR6J9d973c6Wa4MudWWTImmfL
         qc6pCEuKRW2DUKpAiUS7P8mMX6JZ/KoYDeEsgmjT6EzNmnfNZxqkSZeTPC4Cdw4DyvAL
         H2EA==
X-Forwarded-Encrypted: i=1; AHgh+RpDDo8Cyfa+tGzh+DIm2/N+/1qngm1FblRLTy5Kgo4OI9m8MH7miGcBqsPYLSk9vrjRF2k=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMqeV/cPDnW399nxaSaEnEB+gU+LWPpRTkV5IddK5ozgdOH1bw
	bMaAnVqTUrvqJjtJ+Up90Bpcth723bIX7QCRUg28zpisiU6ga4ZZcua5EoTbMHKXiv+qxIQyId7
	laOvlglJWwOpWpumH+WnsBuYIR/AI/68X7kLc2i2VDrY/bOfSBLpkKBN/
X-Gm-Gg: AfdE7cm0xt+bDYPC0AeYVcUxFTGxnW5+UoDRwjOgEOYcbYg5bCJ7I6IKwpCjgonYY8v
	mEaCwRj63qmAGLiypwMW9nkPdkyDtvz6xzw2tSr5ukk9u+meX8fCbXDD4iT/nxkzfJYoR2IDwOa
	cgNvUOieVSlNaOOUP4GTIzr+ckHWVx4OE5yeEbCZ1D2SmJTLaU04n09uFUpeNkQixBvHcVlO7Am
	KVKb/eNmn7sBon8ZnOmPldhsQkdVxG8w5CBTcMqj3mdRXsoyDcM0Nlv4kCzSsLWcuFErrKVK048
	6klnmo/LhTp6f1FYLg==
X-Received: by 2002:a05:6808:c3cb:b0:495:fa67:7496 with SMTP id
 5614622812f47-4a4cf26bb93mr6980875b6e.14.1784545836234; Mon, 20 Jul 2026
 04:10:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703063247.2521524-1-xu.yang_2@oss.nxp.com>
In-Reply-To: <20260703063247.2521524-1-xu.yang_2@oss.nxp.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Mon, 20 Jul 2026 04:09:59 -0700
X-Gm-Features: AUfX_mzHCu4vQ3381cWLlJf4lmLBc46WP_-kLs73DVkvjTeQs-I65NOSJUBSaew
Message-ID: <CAPTae5+6-NYoP7NQGDJN62AFnGSGW-8vaA1Jdny9V8meeDifQA@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tcpci: pass correct rx_type to tcpm_pd_receive()
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2026 at 11:29=E2=80=AFPM Xu Yang <xu.yang_2@oss.nxp.com> wro=
te:
>
> From: Xu Yang <xu.yang_2@nxp.com>
>
> Previously, tcpci_irq() always passed TCPC_TX_SOP as the receive type
> to tcpm_pd_receive(), ignoring the actual frame type reported by the
> TCPC_RX_BUF_FRAME_TYPE register.
>
> Read TCPC_RX_BUF_FRAME_TYPE after receiving a PD message and map it to
> the appropriate tcpm_transmit_type:
>   - TCPC_RX_BUF_FRAME_TYPE_SOP1 -> TCPC_TX_SOP_PRIME
>   - TCPC_RX_BUF_FRAME_TYPE_SOP  -> TCPC_TX_SOP (default)
>
> This allows TCPM to correctly distinguish SOP from SOP' messages, which
> is required for proper cable plug communication during PD negotiation.
>

Can you add "Fixes:" as well ?

> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/typec/tcpm/tcpci.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpc=
i.c
> index 7ac7000b2d13..c19413f41bcb 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -748,7 +748,8 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>
>         if (status & TCPC_ALERT_RX_STATUS) {
>                 struct pd_message msg;
> -               unsigned int cnt, payload_cnt;
> +               unsigned int cnt, type, payload_cnt;
> +               enum tcpm_transmit_type rx_type;
>                 u16 header;
>
>                 regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);
> @@ -763,6 +764,17 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>                 else
>                         payload_cnt =3D 0;
>
> +               regmap_read(tcpci->regmap, TCPC_RX_BUF_FRAME_TYPE, &type)=
;


If regmap_read() fails, type would be uninitialized containing random
values from the stack, can you make the code to handle that ?

>
> +               switch (type) {
> +               case TCPC_RX_BUF_FRAME_TYPE_SOP1:
> +                       rx_type =3D TCPC_TX_SOP_PRIME;
> +                       break;
> +               case TCPC_RX_BUF_FRAME_TYPE_SOP:


TCPCI Spec Table 4-38 also defines SOP'' (SOP2 =3D 2), SOP_DBG' (3), and
SOP_DBG'' (4). Since enum tcpm_transmit_type defines
TCPC_TX_SOP_PRIME_PRIME, TCPC_TX_SOP_DEBUG_PRIME, and
TCPC_TX_SOP_DEBUG_PRIME_PRIME, why not expand the switch statement  to
handle SOP'' and Debug frame types as well to cover all cases ?


>
> +               default:
> +                       rx_type =3D TCPC_TX_SOP;
> +                       break;
> +               }
>
> +
>                 tcpci_read16(tcpci, TCPC_RX_HDR, &header);
>                 msg.header =3D cpu_to_le16(header);
>
> @@ -776,7 +788,7 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>                 /* Read complete, clear RX status alert bit */
>                 tcpci_write16(tcpci, TCPC_ALERT, TCPC_ALERT_RX_STATUS);
>
> -               tcpm_pd_receive(tcpci->port, &msg, TCPC_TX_SOP);
> +               tcpm_pd_receive(tcpci->port, &msg, rx_type);

Please also check whether TCPC_RX_DETECT was actually programmed to
receive the specific "rx_type" to begin with. Perhaps while
programming TCPC_RX_DETECT the allowed received messages should be
cached and cross checked here. This would prevent unsolicited messages
from being passed to TCPM which poses a security risk.


>         }
>
>         if (tcpci->data->vbus_vsafe0v && (status & TCPC_ALERT_EXTENDED_ST=
ATUS)) {
> --
> 2.34.1
>
