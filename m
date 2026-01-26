Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2294D288CA3
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 02:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769395219; cv=pass; b=HL1/msnqOqZLhQxLdCOSye6PPOJN3m+BkAAbiONWMS5nRKgugE6YY4dh9xEyCNPpYgsfrB+wOO8yRMgwW3PhWB2zV8on/XzDXDB9AWEFY6Yl14L5XLTpg54mVKD9lTzQyvpYVFLXMp4gEM55/4RvyiebFCJV08U6He6puUD2eiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769395219; c=relaxed/simple;
	bh=616QhrlzhsduC5LFaVzcSagnL5T7/+Y3v03KSDkabE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z5j9DMHXnC+rKgm7rEUKFMoY8K/H2lRqTEZRDV8MfQAQMjg/GR9uUrn267PSeJx47II22QJoWEo5Bu2ivnFVZbDe/ZN1aOzTvFePcMCaeegvjjumDgosW2KFmi48EABR93ndxE7V5mnOIxObJE1bcgbxTwlAS6Pr5AcymhDSjzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bm92hUNV; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bm92hUNV"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a76f90872cso20637215ad.3
        for <imx@lists.linux.dev>; Sun, 25 Jan 2026 18:40:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769395217; cv=none;
        d=google.com; s=arc-20240605;
        b=ehrpVW7NPjzIUsbpWX7GJORGtsvbmUdmgYgvjM7D0cjOSbcxlchYO4rueYgzJ5pxIR
         Uow5ZlT4QxJvOXJFWIbDSjsbcWhV6+ZG6fhO/rAI6B1TGPZfe9Ui9J6HtZ1VicbogUAY
         ZxuGgxoxb/LMKrvfANgGJWYPEvYuF0U9OYKiccLy/X9bYMc2zSrvJ/cp2mBv7NnSvhlH
         AJKj15LDyJLvr2FRqaCROPpAFosXTKZsJngdkbQpqiduMnYUqnEYPUeHsEGnRui7+9lg
         TRfYaj9I528D9s2hq7oUF/H6DS86d/zoy7grpi+A9sKKcZeL+q1qcNeCo6o3WtiM/0ly
         1hew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D8AR0VhDV4OTwQ7mRcydNkMmnlFjeqjkMVYVyByfRmo=;
        fh=759l+FbqX1A9oMfF+eiWfe4Q5qJ7VFlkZMDi+UZ7kIw=;
        b=Z6qXEGuE+j2cvnMjKUGYm768ksiJUKhD266LKTxrO8UjBjjHRR7N2W1GyPAQdC5x06
         jxnE4IJxKIAOp0eP46dvGcZPUjPVR+q5NgeV+x0CXwJN/9Um1yeCWeQ2bO5/ReJrkoXU
         jnZ321qA2j36MXnqkGdmhIgydYJ/9UZUb9QYV2aJu0Y+06+N800uxNV0ephoyBF4PcJV
         zMvJsnqzzy2q8f6q0K0vI5Vl47eeXJKyqS+f1eInnegDq/pV73CKu6eQAzoOv+PaZi7F
         iSbR1ySI0dOn7sDROVf0kaRUI7B6ZBhkTRgTBlVgvymgywBb1GLCllT1t3X8RXJyI9Yv
         57/g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769395217; x=1770000017; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8AR0VhDV4OTwQ7mRcydNkMmnlFjeqjkMVYVyByfRmo=;
        b=bm92hUNV3zJ3p0iYvNNVpAE/MfkSo2+MWj30t+ULfLbJaHsNeME1ew1iW7FB6GudU2
         /JH35BpFXKrEnIwdKeumM7tCIw0N3dG0M1cw2ZCrRQuywjU62kU5G05OGWrSDUQd3qPq
         nsM3uZqcnn+a8srY2HhxZydtEj2O0947tc4Bu5tCKS/dEs1DoMKkIQ16IciujGVgsiDW
         UnnNMSkvMBpjCPfYYVX+5LEqTC2uIa08FEJdBcW4pnGrRIHqQB2XjhNcvREuc9kZc/hs
         Edsc1tRrEl0u5bxTRW+Mv0xZqkJclbXBaYEz2hKc2dPSv3PSTkkVosQPKXV7ZRbSJZLE
         1RJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769395217; x=1770000017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D8AR0VhDV4OTwQ7mRcydNkMmnlFjeqjkMVYVyByfRmo=;
        b=ah1ofvUwECMURFf9lTEkQD53kkI8CUlm1YZiKI8JddhbbtQYx8cH5NzJ/7smt4nkpi
         YtKUrxAgU4nU+Coj2A2nzp9Wdgl5LtyCTS3J480DFQqRGuN6I6+Ys/RoMSgDx1LaBtTp
         TxFIbIdOxjiWXcLoOdrUx3GBr2q4JXqmHFj9J+qgvgH0DXMDfZXZOzv+LNSrThWgk5Or
         G96hPAgjJEE5u1iqCR5VAW9bqhBzYxemOwtUDtLU7tRa756YIM883cC+oQoQRYmvY8qT
         jD7KOFTVLDYsUnetAh6CjbVpX1tZeLhmMREQcJemof6CEszN65uMUWhAmTEr3qWZ5J4f
         CfhA==
X-Forwarded-Encrypted: i=1; AJvYcCWVDD0NmSmaVR/FrpEXkwoVSUJ+ibJBRbo9JtjzppYw/OJ/Hetsia0r8T4WblbbZbEGLHk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxcHN3Q2J0sqT4YndqG406S21yCsdiQfNPBWskVwkibrQL9DChy
	8Vfu1bDikpnxlxsK9b/oQ2076/iATQgCQe7ne9r7qIZmrBQPig4aoDeiWu+9nqV/9HHiGP5cczc
	C2GL0HJTClW7sJVsLRO2QB/IZgowIipQ=
X-Gm-Gg: AZuq6aKa3+OuSuhsO1JfFuHLL4XaXawsw9RtDb1sUdfEwOwKmuOihEvoQjHThjftjoo
	dX2nxE45Ktyx+XG9YgaJcM1u2va7meDmNtlx3hrrvT9Kv46pt8mI1s57CSwoCO+TXAPl0ewxIZP
	HmCsj2gKKEY0a5ZUq/DluT1+tK/7kPLr3hrqEjFdK3JJDg5vS442qKlJ4wHOZ1BKky6x2FMNXef
	8WF94wQbb+g2c6xJQhj4/DufjwVTzLcAcRIO8pGpGO/9s7UifP19bBV4xz7rB7AVReDQVzFKxaQ
	frGLiA==
X-Received: by 2002:a17:902:cccd:b0:2a0:c58b:ed6 with SMTP id
 d9443c01a7336-2a8452c26famr35178965ad.29.1769395217493; Sun, 25 Jan 2026
 18:40:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260123084844.4051570-1-shengjiu.wang@nxp.com> <86970fc1-c4c7-4a52-91e4-f9f93be5990b@gmail.com>
In-Reply-To: <86970fc1-c4c7-4a52-91e4-f9f93be5990b@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 26 Jan 2026 10:40:05 +0800
X-Gm-Features: AZwV_Qg2Sr0MtAYiWstgnob4vdfKrkQQaosiuPn5-BRgzvr0PJc9FXqje6OXHNQ
Message-ID: <CAA+D8AOHwNPRwdz+M_o14cBgwh1iRfJ6JA4t1yewWSbxdfJhdA@mail.gmail.com>
Subject: Re: [PATCH] bus: imx-aipstz: set default value for opacr registers
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, laurentiu.mihalcea@nxp.com, 
	daniel.baluta@nxp.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 6:08=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
>
> On 1/23/2026 12:48 AM, Shengjiu Wang wrote:
> > The sdma script app_2_mcu needs the permission to access the peripheral
> > devices, so need to clear the Supervisor Protect bit of SPBA2, otherwis=
e
> > the sdma script can't work.
> >
> > As the imx-aipstz is a common driver for all apis bus, so set default
> > value for all opacr registers, that the peripheral does not require
> > supervisor privilege level for accesses.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  drivers/bus/imx-aipstz.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
>
>
> Hey SJ,
>
>
> I'd be interested in explaining the situation a bit better in the commit =
message.
>
> The 2 most important pieces of information are, in my opinion:
>
>
> 1) SDMA2 transactions are set to user-mode in your particular case.
>
> 2) Your script doesn't use the peripheral interface (connected directly
>
> to SPBA), which is why the SDMA2-issued transactions are subjected to
>
> AIPSTZ5's security-related checks.

Thanks, will update them to commit message.

best regards
Shengjiu Wang
>
>
> Of course, please feel free to correct me if I got something wrong.
>
>
> Thanks,
>
> Laurentiu
>
