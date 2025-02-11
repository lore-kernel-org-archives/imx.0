Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49287204859
	for <imx@lists.linux.dev>; Tue, 11 Feb 2025 13:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739279099; cv=none; b=nuJyO5bsw4nwsJNkugx2m7fm3E53Zf4ivEQbLIVhxkWoM8lDn0reJFX1QAMUDa3Aq4bA6mc2UoR2f4gKQjN7Qr2J+azuBnYtL1Sz+meVgEjyYWAX9HD7TM43wQRlcrCNONDcEyHoBoyPX5b8/U1YNwTBY51lGsZFTZNAJnm5SF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739279099; c=relaxed/simple;
	bh=sXnE1EmrYVMTqzdCX051zDX20HTB+AMpDH5rWReVBoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=onFojaMEjjNNhgjRvCywBmVm9J+hSZDaKacP3wYZ/I9ABzaVGtEykJbmHVXYeXNA0pwpqjQVFb4wiiQ0JZi0Hk5fPbtSj27XjzrcBddW0FyklUDA0m5jSTKAqNLXKXfo+/VIaXHW4skw9IapkcREo/53AoZBb8ZYNhSyySFMDk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQ191vjO; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQ191vjO"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2f9bac7699aso8069147a91.1
        for <imx@lists.linux.dev>; Tue, 11 Feb 2025 05:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739279097; x=1739883897; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5mGdMwF5cu1aorS2vZbnAj6wLlbFO7781j7ylyHZ94=;
        b=NQ191vjO0Cysqlm7/39dO/4QhaXTyBHi2fqcmSHzgntq+dvm0ubACjtJOgXi8FE20K
         x5nit6ORufvqJs9XH+f/QnJn+imD+CnOtwkHrnaRsH3HIfFpXmXG6evHgJhmtIWmI9bc
         Y768fT+73HmUQkmqM5AlCsmGtR3krmA92WG3O+RNeWGVbsoAY0CPXG0oqlGTnlPcZkDS
         2NaFWfnWpMSlTke+IAyEaerAh8AVqIEbxz4YtldRaf03GAEzQvVdVHHhHo6CsvTNlAp7
         rks4gN5GS+K5NZfI1aER5zwPyaReBW/sNiHfrvHSU10abt8pDf+v0yaSl2lO11pekK9f
         bnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739279097; x=1739883897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I5mGdMwF5cu1aorS2vZbnAj6wLlbFO7781j7ylyHZ94=;
        b=ixi0v9Sxo8v5kfwXa0V741wjz/wVecwjNIW7NnvT4N171qWY1lsqpMnbopmQxIrEQn
         LQqksH1DEf/IMWQeammthHleeWzg6nDiki6+R/JlVTrbemtwW26j5osg/w+9OCA2+A0k
         ghuTpX+PmaRkW+I2EGDSH+piI+PRx39t/D/2LGvrDHXnbQHfVVVzHpuAklai/vrv9ZmZ
         cvJB0wLxNAIRRyAJrad3lhKIDqQLeyZ+WCXHIECKs65Im3KM2XW2R1RHgWtjOmCfoQ2Q
         ca4TPNNuZx9ts/pvoi3CDD0Y09QUc2MizIKLHDyXF/xwLQ8lx8HwUJxOt7dBY6eITeRL
         lf/w==
X-Forwarded-Encrypted: i=1; AJvYcCWNAjDYLdfXpwOWPlRL4eo+hHsrOfGWtBqYHhJ9clyYzd9qBPWNtdOgypkuTN1v1ksG7pc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwkIR/nx9NTODx9p6LWWdnL5tg1sH+WhFmgR2pQwpmFwXMO9Fqs
	yiGwTpHxb6+oHfFoWROiQ3O5C4MOeut0q/1fCHWmZWwJKRqxw2YYyhFXbqgbp4uADwkf10vt4+Y
	WrKy7OAVm78wxRuoealWq9yz1ims=
X-Gm-Gg: ASbGnctDOi8hpOA4jGJdm/BZKfP9i7GulLcjfjm0bzZ6MtVXV95HFm5NhBNCMc8ddm7
	GoJF3ExDHr0D66ZyfZdb2wGFqEb3fchmTn/M+Z/S5VDQYHWH3s3FNayUGTD+Z+WhNr/68rg==
X-Google-Smtp-Source: AGHT+IHxrSbz+UMf0ZSE5PZbnCLY0l+6wu1dbGZuTcxLw9cyD1B/2N0NzHUPXxohK81nTZucVVt76ckOaeCaUTE/ZDI=
X-Received: by 2002:a17:90b:2545:b0:2ee:f687:6ad5 with SMTP id
 98e67ed59e1d1-2fa9ed5d37bmr5548858a91.2.1739279097573; Tue, 11 Feb 2025
 05:04:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250211035737.3886974-1-shengjiu.wang@nxp.com>
In-Reply-To: <20250211035737.3886974-1-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 11 Feb 2025 15:06:26 +0200
X-Gm-Features: AWEUYZkxR9jtS8NDetBx_vRl7m1cPQuJxMC1s9IXybxI-_qoyigAvbqfYgvFG70
Message-ID: <CAEnQRZDC+mQ=QzzpBsXzt0kSSDAo-LbfRkbDLfxrbxW9Nse-+w@mail.gmail.com>
Subject: Re: [PATCH 0/2] ASoC: imx-card: support playback or capture only
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 5:58=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> Be similar to audio graph card, support playback or capture only
> for imx-audio-card.
>
> Shengjiu Wang (2):
>   ASoC: dt-bindings: imx-card: Add playback-only and capture-only
>     property
>   ASoC: imx-card: Add playback_only or capture_only support
>
>  .../devicetree/bindings/sound/imx-audio-card.yaml         | 8 ++++++++
>  sound/soc/fsl/imx-card.c                                  | 5 +++++
>  2 files changed, 13 insertions(+)

For entire patchseries,

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
