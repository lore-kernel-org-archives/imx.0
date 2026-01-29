Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97671372B59
	for <imx@lists.linux.dev>; Thu, 29 Jan 2026 09:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769679468; cv=pass; b=CfbFLC4QzZWdJrr2h7pCXDMZ0iXM/SUZWi0/szNZhfFyBqYTwQV2cE/ijR2e9cSNTKdK+j/+xSKd4UbZIftkV0bJEIEjWna1sUtwX0ppNbRw+uI12tfwsMwDK/3OYSreMZG/k7W+bRAVxbncZOK/mp1KO4Mw4dBnneWAAdCAWno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769679468; c=relaxed/simple;
	bh=zcM05kpdQ+n6MUDgSMAvFhhgb3WvkgEVy1gJ+6lV2Lk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MSHpHaLlTCWLlnF31wXmPXlmy189lw9baBx7P5y9rvKDX8lJBDtn3S3Ed0OUAwGjD7HSl8YcBt2+AD/4ekMXqa1nnJlQogDcmps9TR/pWgzSqI5diDPuef1fuk7k8kqEVcJTLDRgG4nXOeUqeZG5IS6dKBZtkI2HbnX4AWINwtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R6FpHiJc; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6FpHiJc"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-34c21417781so392030a91.3
        for <imx@lists.linux.dev>; Thu, 29 Jan 2026 01:37:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769679467; cv=none;
        d=google.com; s=arc-20240605;
        b=bQAMwO1OABv4mOvL+NZueP0ICwCJeDlLtnpTfcWC0nDvvyhd8CtEc5MmWik2OW9VZ3
         tJ0vUSMF3rCTlu+zdlnHlKhSZI+tQpltmPaUeJT6jHhWOaxbkxqv4YEUGIq9auAmFcTx
         ZMirwz1fflDnhdQaYW5R89ezl4H+GOgVKa9CmWtfpd0wIapkxd3WZYYMeylaSiqZMhIz
         ZhzPOvhX+vWrliN2IWoZTjLr11/DesgScqHcTq0u+JqkMPYhVpyACpnGbpDufseKADgZ
         IQb+OfwbMV4j7HgVdorJ400AbSwQr9C7hVgGAKjBkGMJxzlPXPOXpVs9PD4fJTqMLJsS
         t07g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4lU8GWlv78rS676V94HHH4zs90Fwj2GtCQjzXirgDFE=;
        fh=IyZcwtye6Gv5ehFhbY56xECDyN73bM0u1NpklMwvZ+g=;
        b=SeRRIDSuitRqJHzPoLJlWUCwNStCnZijFTNmtmHYoQpU+nkSoCz6EcU2O7EcEGQWyo
         iKv6i9EC8QIkUE3QOhcVUeg/TC1TKWoES6BlOHhOxhHjyVetVVWt1KXBqEyY7SIwwuBK
         RlgSpDkWxgrlYgTEI508MAnCEbp32a+u8Jcf9jGOefXm+Ah0jBJFvmtVutR1je1tkVEo
         nPa0XDqs5SXjqo3EZANtJLOx3tXINuUcV7GVh5s12PUghpSVmWW748Srw+FT3+/TKFIT
         BPp7KjKDP7pDrLZzmzqc1f3lhlRYejXH1j2VVpR15tbesbLFkVwyxVOjnL9onF1xizbF
         Qb4g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769679467; x=1770284267; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lU8GWlv78rS676V94HHH4zs90Fwj2GtCQjzXirgDFE=;
        b=R6FpHiJcp8gJA61acCYvgX5PVplHwec4WUE3hmDTYZO8my4he0/yxsIm87E8z9FxZm
         7lOyx9FbqXDLFSMQXMREQkfhI+khAS01t5EduUU44vfgwyaDrb1FgoblslpEU/s2O0H+
         QjVAtyajg4F8yW8ykiWFttFqqM7Dhdw6dF1Rx4geCp/JOoDaWUy6g8EG2OUYuYWX69yq
         qbvXsqNEe5cs2iv2EA8CtitezM/Co+ARdUlJif9/eqPHY5JnNkw6TQsSToWQFi6Vmn1y
         EO65+nl7Ao86H9ubYAeskx5AzvHYkyoWaW+q8uqT8t3+/Dx5hlSaIhVz/X/Qq9Opm0qw
         mJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769679467; x=1770284267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4lU8GWlv78rS676V94HHH4zs90Fwj2GtCQjzXirgDFE=;
        b=Q8FtxJY7/w4TgKaT6/m1ItMER94WMvIfrw3ZICsEV3n0Q5rpzgH49Eeay/qmo4CT4E
         HqbHV4gPWpc+Db3GMuYIBKycSjBxt+rNktJ3cMzOFJRSONzDZ8Sr35XcBBbfd3IAyyiE
         g93hCHTd7FG+SHiGAoY/5YEvsuMC69aKKa1fxn6B5ziQYsWjdiBjRW6cKNu1TcU8Hjlh
         BqrfBfiknCjd3TUIzJ1Kul984sJs3/iV3LuvndiH6M3WBUcp1wG6AO0nctOi4MLjosxU
         BEaSdvuKq1P4Wa1+BSvMNtZABuYzj/VuzYOR45abkruolFJYXmtNpZCOgGmowQNQy+Np
         JNiA==
X-Forwarded-Encrypted: i=1; AJvYcCW4b4e6p7q3DTblaf1HJrxRJDq84Rv62wRJ1xcjwfwdfJZFz+/bYtUJoQLtCjwDNIEYl10=@lists.linux.dev
X-Gm-Message-State: AOJu0YxI/7PvH4fuei1ZjjWs3/5CGQkwkHPEurrlwOhxXkuH3Ky11EmN
	gkAO+f/f3X6e5bWGcPPAg1iFJd0Uvzr67ED8+tSAgOTgIw/21BgIysLkjVvKF7PspIV/bfqebBX
	IsT0KMB972u5/q+KWs7MXyCZ3JX8YUDE=
X-Gm-Gg: AZuq6aJ7dIbw0nSkSYXDhFe0yft4ZZ7rsJbplRZeS13Nl4VLD6Fb4mApURWjERd4KFE
	9pHexRLD0tCwIKOQza4Vt9MMQau/Hg/qejrlLX48pdm8J0uDsvkX3mszFKzVR1TMP3y06cAkDzm
	VPyOwKoLhWtd+ZwYwrrEFV/2+RUX+AutTd8C2mFN272Nhv8rw9rKfjcJ9wmWtFF6aa+icxMTVYf
	73oFDTOZF+RGe/On6R/zHaV5hZA6kDkaNj6UHJhgRwev1tCtPe07rCiwCAErPs/cL3oZKk=
X-Received: by 2002:a17:90b:1f8b:b0:352:c9c9:75b8 with SMTP id
 98e67ed59e1d1-353feda27ddmr6746159a91.36.1769679466914; Thu, 29 Jan 2026
 01:37:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
 <20260128071853.2602784-4-shengjiu.wang@nxp.com> <7e34b098-bdab-448e-a34a-02bdc643f700@oss.nxp.com>
In-Reply-To: <7e34b098-bdab-448e-a34a-02bdc643f700@oss.nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 29 Jan 2026 17:37:35 +0800
X-Gm-Features: AZwV_QjhsaT3WGqHFWhY63rZWE_xfRO_5posf7-8hnrbY9543Mu3MY60Z30GXKk
Message-ID: <CAA+D8APbzGCSHOwGyBZjf1TYqo2K0s0dvoLjHS+FsT_RLGrb2w@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: fsl_asrc_dma: allocate memory from dma device
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 5:22=E2=80=AFPM Daniel Baluta <daniel.baluta@oss.nx=
p.com> wrote:
>
> On 1/28/26 09:18, Shengjiu Wang wrote:
> > As the dma device may support dma-coherent property on the i.MX952,
> > allocate memory from dma device to make asrc driver to be compatible wi=
th
> > such a case.
>
>
> This commit message refers to imx952 but the change in the code apply to =
all supported platforms
>
> So in not really clear what is the intention of it.

The dma-coherent property is used to indicate a device is capable of
coherent DMA operations.
Which is applied to the EDMA device on i.MX952,  in order to support
such EDMA device,
the memory is need to allocated from DMA device,

The code change is compatible for non dma-coherent and dma-coherent dma dev=
ices.

>
> Also, it is not clear why do you allocate a pair only to free it at the e=
nd of the function.

As the comment in the code says,  it is to get the dma device handler
for memory allocation
. After that, it is freed.

best regards
Shengjiu wang
>
>
