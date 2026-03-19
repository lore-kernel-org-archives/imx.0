Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87BB3D47BD
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 20:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773952638; cv=pass; b=hUoytZs9GNfNK+dgbl4ByXk/G76Kpr4aRqpWLoSzhkVe1xC5fEL4B17wT+rqnuqJD3U88xyjihhbaUq3kerHlsonYT/08D0Sfld5rpUgsPQbLGGfghXozzj9B5fan6Lr9lhzfzuY4QrUbphBycjDnBloajrFS6aDZBpTUjZMgAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773952638; c=relaxed/simple;
	bh=OKcQF1kpAs1PMLQtJxV4BxsdutnEF0dS5maqemA1Tzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C2t/owMhR7FJUbQfRXIlNYmFIfciarXb4rG9cvDrjlANbtQ0woFDc1DSpnI17wrFT75YlfOej1XdwvpOmvR19eVystiaA+oLhf/FxtS79BHIHzpwER72RgBndw8SGHujtYlPHaeAf5lK7FgusD2XpA91n8R5z0nJ4G/QxLF1X3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YAg6c4gr; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YAg6c4gr"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38a01c80c34so8979581fa.0
        for <imx@lists.linux.dev>; Thu, 19 Mar 2026 13:37:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773952636; cv=none;
        d=google.com; s=arc-20240605;
        b=Tu6I8VFxXm9HyLwvSC6DIslqsJJsxFYH4ea6pOtHrXLpba9rNs/Dg+05kdsN+Vie1l
         xbgsFH7e6BrOG4TpDko5VRZvcl/yX3CIns4JAQSrwHqgXiK4bFLcnR916294MIdjfkuH
         K5M93dqih/2xEj8IXx7y37una5gfS+/qQ1wbQ61X1vNIoC/ouU0YKx1yR47+B+t5u1HG
         YnNVz0Xr6aAz3D6nSXFdxYI5ZmmlDjs0dztrx4mSPLSJZrQ5T58tyqGcbYZB4TFaFKA9
         +v7B2GPm2ivckmeVGD1fkB73PDUrckcl/CB0yQ8TKZY5ef582JBq0ej6ngkoZtqah+Bh
         UGkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4jm2MmqwJpQn+S058TYQTUmQvMQC9Tb/3vBRI4X0gPQ=;
        fh=Aj5ZcOtELAnyaiJv8MY/GUeCdvN+wmIpiFG8O6BuZpo=;
        b=eWIDCUiNG4AyWSXfF3ot3eszVFXKjSTn7ioykWXf2XuwrYzlGLxLIl/dmzX3WZbGhY
         xuL/lxFsBoBrJ5gTKtZWEcpVpr+AMDPq9CmrPfwz1unjEwSDvnqBIWQk7kohBlmE/23Y
         rkq8iwdjoXRCb5V16k9IBZipNRSmShJzWu7oiLnNgxFBvkfjlGj0uLplCWlISHtSxSR0
         4GqD90MRfkE42GdvuaX+SRMijnbBYVDeqUJxriM3TL5CYKEmlZfzckgRGsXesCVy/WO7
         cZ1l92NtzO7L/YBySsOozllHGIMkrHaG1VDGXYrHz2faTtXj8t8SSdxBbrwHIbNGmiB9
         CMJA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773952636; x=1774557436; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jm2MmqwJpQn+S058TYQTUmQvMQC9Tb/3vBRI4X0gPQ=;
        b=YAg6c4grAULEUi0U1MXmlRXvAbqBir1Y/ZdO/qb5RW5n6dQTsmTAk+CmjYxVWOydzq
         2B0bsu0vLIigQgxbSC541+hvRw7fOnWGZbqKAwMJ4xG16Grhm3A21fWcG56mV00JKQsD
         uo/w6jl/sxksyOjkeMROv1vM9UjlpyUuX+PmShlKZ/Qnn6Tx7EVpmjcSr8PkOyBBdifc
         y4TrkH5KbvvBoMp3SggM12QXQFNhxBAJ0cq8Xi5H3PL8zW3Zb94EpnOtO0QTQPnM9Oa1
         GCgyxSBz5kQ8+teRbEeOFWFV9lYuhtwZWVhtLEaRXkpDEttXlquhHcpzyaa5jl7Qtsz1
         Rc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773952636; x=1774557436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4jm2MmqwJpQn+S058TYQTUmQvMQC9Tb/3vBRI4X0gPQ=;
        b=gK7oejb9Eu4OkX8gB+N5BpOcV6GTTxDJ6okO12OHRpFA17+53LKP5MR5h5vx7ZIMRu
         cPYrkKueqmojxOEf6LhbFnPP8ULVQdv73NVmEL9AO5EAkAfdWHSQPEnIAw1ks74zQBKa
         kplFskc771/zVGXczzd84s7QfavfH+uv7qMVrpirp7h4vTQnituCXxcYh/LmqkfQ0yT9
         SagSjj97NUbHLtYqE0ZXRhj8VvUZvRT7Z21OnhNTQZ3B8G3cgX53nug0asqhHKxtCTF5
         cisBFB8oIbx2s1vmsIBsEmyyXPIvXDVmG5+f3woPzvsSBt/eABVhJ/JE0Hfc8H15A1li
         i01w==
X-Forwarded-Encrypted: i=1; AJvYcCVSL28RLklvwGWcmhs6QqROGP4S8Ef1DGZdlOdDezZ2ekYjZyKuPXN9G3H1a2XL9fsCeAI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3cN5D8uCfgjTC7qJNgloQHtxgbovIQEOE98i4SEARNsa8npMc
	4VGzRFZEyMGcyIvzF+1ygjwyqpp1BBwnYSnSXjTT2cdVHq9Vvq5sNTOWkO1x4xv0BNnv+L9H/FJ
	1fUtgHVAf6d01poz/0Fiej3qUEl+njMw=
X-Gm-Gg: ATEYQzw9VJP+kHG0YqPi00GXysNKtgYEGdjoPdZffmCkBzFDofgg2FDoBNetp6znM90
	N6Y/iMTMeOm7Ju3yuS7xmkS7iQpRa1zJQ0X0ROitHxWDL0OMj6kbA4F2u27EMDdIAshTka6L42W
	p3m3/7QOaIbKr/ljlXF7+9cm5ZOs2pgXJEBdLr4VMAuf0bKCP41Jokog773CUhxzeAbABE1rsR2
	GEr1c1Vww02tBcn7ph+L2bA7mVQf+AmDdbXeNEmxo7aF7Kq03irspkOpmDP9A86Y7ipKyEiAGn3
	xf9hfW1Iq+xIo8ftEM56BpMzPWjWcVZOz6F12rpIuXK8e1p6xowke0ex3Xm+Gt7r5oAK9aE0
X-Received: by 2002:a2e:3215:0:b0:383:18fb:fdf0 with SMTP id
 38308e7fff4ca-38bf96ee31amr2254101fa.22.1773952635602; Thu, 19 Mar 2026
 13:37:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260319200945.23333-1-adriangarciacasado42@gmail.com>
In-Reply-To: <20260319200945.23333-1-adriangarciacasado42@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 19 Mar 2026 17:37:04 -0300
X-Gm-Features: AaiRm50-FVCrW5uqx_caj9h1BrDi-gvkU_nz1UeamW4uIfef2gzzYIjKPKykSOA
Message-ID: <CAOMZO5DcaucpKj2=gO5kP3vd=f==ydzB+3FbGB4Jwg19Vi8fpg@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] mmc: sdhci-esdhc-imx: remove redundant mx25
 handling and consolidate soc data
To: =?UTF-8?Q?Adri=C3=A1n_Garc=C3=ADa_Casado?= <adriangarciacasado42@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Haibo Chen <haibo.chen@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-mmc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 5:10=E2=80=AFPM Adri=C3=A1n Garc=C3=ADa Casado
<adriangarciacasado42@gmail.com> wrote:

> @@ -873,11 +865,8 @@ static void esdhc_writeb_le(struct sdhci_host *host,=
 u8 val, int reg)
>                 new_val =3D val & SDHCI_CTRL_LED;
>                 /* ensure the endianness */
>                 new_val |=3D ESDHC_HOST_CONTROL_LE;
> -               /* bits 8&9 are reserved on mx25 */
> -               if (!is_imx25_esdhc(imx_data)) {
> -                       /* DMA mode bits are shifted */
> -                       new_val |=3D (val & SDHCI_CTRL_DMA_MASK) << 5;
> -               }

This removal of the i.MX25 check does not look correct.
