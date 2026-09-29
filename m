Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078681F3B8A
	for <imx@lists.linux.dev>; Tue, 29 Sep 2026 01:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790645841; cv=pass; b=ZD/CeJ/A8xNDl9m+hEARIaq8luUzlC4Hs6m0vWhRBAEa45TxujnYfxjrx+0StRj1yH15Ss+48IuN2Lg6AOTcbK6BKSXpNHWKqYAXm+JQOnxeUSq+fqZLoOpPKeMaEgGSvPl8qfFQJotRALmlADYbloX7sJ33yFV4kTsO93BGIYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790645841; c=relaxed/simple;
	bh=bB/l5IzBo3Uz00TsP6msX6F5bA3Pf21sY7q01hxENmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sRu4aUcESPTLL4pwtJAhrl3qOeMC8Md5nNVwbanOajvR+XDITAX5mfXHQJKtqo+L0ybvGRn/L6S2bqsw8ZfWLCo8syyJaoMFjLSQ8AGuiJxzZ+G+Yl6h/1Y/Hlshbnatn0/kdW4CPYUleN12lCPlnOWctOl7GlqKiIRYrcORJbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNCxMQdP; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNCxMQdP"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd58e1e2c7so16364495ad.0
        for <imx@lists.linux.dev>; Mon, 28 Sep 2026 18:37:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790645839; cv=none;
        d=google.com; s=arc-20260327;
        b=lZ0QNnnl4t/4GWR/cF/Z5mEa7l+hrPniVvGRmuSwV37YAj12FvyddOnwrrHiFfGFAc
         Lrtp1Kd3Ep7DQahVJ3SQ8ODJGexQcdMa8xBrU5QaKMf7ffoLH8qs06GjID8RC9HNkCjQ
         BiX5sd8vgyVBJY4GzsupwWVTjGdYTbDlUsvqMp08LbikCeX12xzHrS+6CJVqLKvuIBJ0
         elaKpmP8G+v2jUK9rHUNnwtUAdgcurSwD4RjMieZ9eCeLKMFTWVZ2V4Yhrdsk3k6AV4W
         zglLchAHvJPrEn8PTwGkAufY6UAjrWrehcQFTpn8hJjrayDZur0Tnpu/WOopg03UR7vf
         eMJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rnkVO0aoE0KnX2d76+g96XFlNkoLJdwXuRaJYCNLsiw=;
        fh=kIc9w0nRXZuhMv2qdyGC4VY42lZCrfjnaCU61ray3tk=;
        b=BQ/mSVk8rjg942zP2LbvdvIGD1BoF7AnwsPJuXesgE+s4unutwm5xGhCn8yUDDdtyP
         hLDm/dEoPT+Wv5y/ZJ8A1G1+UfRtpubQRp+SuhvABTPAHHfeQiviIFb1oV48WPPmxSc/
         jiGvdbj9DFkwJ+m5uL8uuQI7D3Z5P2Wqlir2l/oCGMAVKzPKtiyIPyrPbovRF9xTB1MJ
         MAE7ZEkd7ceyQzAl5cNO41KdHbeH7/PDq6dHhjNkiLbmMppV891SeTQ5eOKhx4n6TFJ8
         y9d0BTAi3HnCKqheQfQxICVsrRZIDwSwGt15quPf0jISmBDjIo3xCKAPOhukrciTig8V
         wQ+Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790645839; x=1791250639; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rnkVO0aoE0KnX2d76+g96XFlNkoLJdwXuRaJYCNLsiw=;
        b=jNCxMQdPcegU6OBTSjYelyqBvs3S8RcB1OPLNhYxULAicXrulu0CUE5ZvIsA5hsrXM
         WRMoVzceH0B1TtNJSKTPSzn/YuBnHJtgKqizhZXoTv9yjPZWZJNk/4ffOZVQb3oW0E2T
         8DTSqOVgJsjyFEkrPiz+18q3qTBV8+IdYSC532RAVtdecgwJVqFo3+MiTqBNeIKa/GTk
         zH8sl9s0tEPUltK1CwdHQNgeA9bF+Av3sKQZiByYi4h8TeLal0vkACwpSnjh+Kcor+F2
         MyJs98oKIHlztxuUPATtBy/0x6O8LvwhE1MjHFioaqDDw9qNc1YvSSCRbFwPXsf6Aq1d
         Z36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790645839; x=1791250639;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rnkVO0aoE0KnX2d76+g96XFlNkoLJdwXuRaJYCNLsiw=;
        b=YWVVegrvaIOiziuGwDBXsx/Ajb6cKdIccejQ9msuW8u+9fUGXtUJW5IQc21pvYeCw5
         xgt958hrnqatOEzsZoa5dgu5fh1H9pEdzZMRBvhJwTRh7/ozIGdav5UBwVuUJT/OkeHT
         ykn3WAm1isJeI9oneVMKW3PZbIR5pURQX+Ndn6VbMgKw5NdfbuRFzGmMA3i+NG34B0Dz
         OmgDZsrrt6bC+sEBpWL7fLwW1O9OIOzK438Tf6xqLIOMBAlXep9cCgFZ9aDAqp+qeJCk
         dX52OrzFLFoVIDFiOyYnErVPqld9l4MBkO2I0NyI0GuXTnhMvCobd7egu12FYT0LZAkO
         OArA==
X-Forwarded-Encrypted: i=1; AKwUvBztlqmNlFkX6ac0Gji36mrXn/q2zta8hcYyFJqM4U+bvpUSdwrDooJCwHrS6vNSDyShtaU=@lists.linux.dev
X-Gm-Message-State: AFq9FYKDAIqwrzQgKyKnr72TRfJHHkO83hSwNr7MvUdQ9sJrkrN1GajL
	LVhXKyxh3CStaqoOstrHJfUq/O2xo8tDPHE5IxH3OzUIwttZlWIXt/ZdSwxoIlP8/TaWNgdYkWM
	jbkJOvLA8BnIzCpLHO3IrMNDgl2vHa9c=
X-Gm-Gg: AYBFou37NYaV8rZ6iXEl7+J/d/fRelduEbVhnR2ljFzFf4QEvu0tC7UueL8lEhgJ8sh
	+JkyYPHDzb5ty6nX4DIZYJtNuag0o61EdI5U/Xqzbva1KXkca5ZX+Q9xjp9kvZkxi/CGlKx7TAI
	EEdeqVC+8FURHq08ocszxcZSRija3l0XVgW7vMwhrzx4GGZMjTQC0g/aHzo6ugsUWbBQj22VuQh
	a3SQke9L0o4Wlbt0N1t/drbhzPEZ1IfS51Po1Cplf6AixMbwqR4tmyBhSa/30bIGZgrE13+YLMJ
	P2+ipAt10Zl2osvQb0JURihvKy/f4Vl6VnPy1ezHiIzBoT3Jp//8k5M=
X-Received: by 2002:a17:903:3c4d:b0:2dd:c100:b2c6 with SMTP id
 d9443c01a7336-2df7dc506e7mr124008955ad.49.1790645839130; Mon, 28 Sep 2026
 18:37:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260928061727.1844167-1-shengjiu.wang@oss.nxp.com> <7be95093-1e29-45a7-9860-5605763baaf2@sirena.org.uk>
In-Reply-To: <7be95093-1e29-45a7-9860-5605763baaf2@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 29 Sep 2026 09:37:05 +0800
X-Gm-Features: AclHuK-gi7etBZa6zDkid3kRxBB448XKArKELjgsns_Uu77zQnT7DY8d5A5ELVQ
Message-ID: <CAA+D8APNVx1P0G2pPJ3W9u0eY2pqsKeV0Ar0Aau9AeR5mYgpgQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] ASoC: fsl_asrc: expose individual DAIs per
 conversion path
To: Mark Brown <broonie@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Chancel Liu <chancel.liu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 7:26=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Mon, Sep 28, 2026 at 02:17:27PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The i.MX ASRC hardware supports three independent conversion pairs
> > (A, B, C). The driver previously registered a single DAI with generic
> > stream names "ASRC-Playback" and "ASRC-Capture", which prevents
> > multiple independent conversion paths from being used simultaneously.
>
> This and patch 5 are not threaded with the rest of the series which
> really upsets b4 :( .  I'll fix it up but please look into your tooling
> here.

Thanks.  There was an error in the thread, the patch 4 and 5 was blocked.
Then I resend patch 4 and 5.

Best regards
Shengjiu Wang
