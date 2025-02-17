Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5A4217727
	for <imx@lists.linux.dev>; Mon, 17 Feb 2025 11:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739793393; cv=none; b=IxOklGfP/sbvdE6CkgbnBpnrTHmkrDR7hOdJq8VT+Pa4zSzzaaf4A75RKKGTyzbeoo7CfqFWBkHJIzibpAwfM0iqilh2i0NxGLP0JJ4tRBhI1NHB0DHOFi4aQH24tqKdUVqHl/uAmX53T4w0Mut5qXmhE+qy3hJvIzzP1DP7LOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739793393; c=relaxed/simple;
	bh=RWb9c12CAhxULoD0dTGRwfEz9mcz+7D1z6r/WQDA7rc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gsJwmLBrlKoyTnSgDUhX6HBNDwK9en4gSzmH5QeVh4bauYtEIiyXu5i+sucH2IuqbpivytIRZF8AiTSTR+XLoSilBiif6cfv2ktjXfsQswSA/kORIGXaJAGokSbrqY9JF8dLUcITipIMhsbiB6vyRO3Eyfr/gUw9LzGwsQ5AUU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LPZMEsTo; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LPZMEsTo"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3072f8dc069so43449191fa.3
        for <imx@lists.linux.dev>; Mon, 17 Feb 2025 03:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739793390; x=1740398190; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RWb9c12CAhxULoD0dTGRwfEz9mcz+7D1z6r/WQDA7rc=;
        b=LPZMEsToHDhIQCjs268JZG0wWLzq/INFvbmM0MMKqCpW8neZ1XJpok7+H07p1D9+T+
         qZVqKVJmHH/n7v+Th+suB+3jKMA57uSlieOxQEEKjRwGaMxyPPd+dlHyFT/p8ghyt8rG
         XhKgLEYJ1YqZTV/vFbsWE3P5DKjY43LE+Dkr8XL6Nq6LFP2gq4kqtalDFIMyd13EAgIY
         Inwo2ltC4MovUj2a4Y4JAwFiad+lYKEKLIuVkUUvNojrq9fSYrcM154T2V+oWAhTzZxJ
         PVM7xo6ArPm/3lxT2tCOMr12UJ44JkIdWyfUx08ALKYshjF5zL8a8m/hm93I4xqw6Jzq
         8luw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739793390; x=1740398190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RWb9c12CAhxULoD0dTGRwfEz9mcz+7D1z6r/WQDA7rc=;
        b=EcxdZ9MsZAKVL7PByYhXLa6FX8n6EGloBAhX6VhTyZEMPiQoSijL9URloF500TFg15
         rW7aRQ5LyI5ZDp4bfhL6k+qIcI9uRMCx7JMqTzNQiA3Ag7tuW4LdIuVncVeOJVcNsTQu
         UYYxbAKpTR8DWOSi/ewYyB6G9TMG5hf8tbjxkX0RhBmAvsUfGV9vbOAs3i+1+mVaVsec
         bSipYy3guV4CV/uq5fCszA5r9UjrkTNs4vaJ9S5j4R/SlrxDHje/LgKvDAc7pV38sZwc
         AARkYu6g6itt4XpJk4K82znmK/N23qvzRFQW5ERx6Apt7zuYx/sNcFRdX2kvtiEeGNR5
         DoOw==
X-Forwarded-Encrypted: i=1; AJvYcCVT5Ttj02i4qDJCnLLtu275mh/gILhlKqRnwhsYlLSt4L06PJTaH5M73jcahn+iVoVV8cY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyxfE/g64YQZ3/ocMJqgpbwTHW9b01i5HfvA8/xdYilERPTJJoc
	lrPupHAcxt/C4hqkmx03yyOCOKrmq87IIgIIln0sCNYQyxhMSonCbVnu/1eznXnqyzeYTfYpB5Y
	gmIAjlHb+PwFrw9MXtp4EFOwQwdY=
X-Gm-Gg: ASbGncsLojqxhy1FPu7CsxCMb0dKegYclONCxPvhjqzaelKnlXcMBzvUQwsBUG5ysY5
	O5ClvdAEDMad3oiAAZmydJvEpI0ew3/DWI39gKPcpFamZTCeZziYW0hIwmIJcm8r9MqAuXmbBH5
	KMOApH8IHjVA==
X-Google-Smtp-Source: AGHT+IHtj/ZdhxXotccy9rIWf5rf13ssM1qX/siRW2ohOQo19dHThB2bEMb7IsViEOJydxxoEPlta3cBjBRhxTyDCxM=
X-Received: by 2002:a2e:9e11:0:b0:309:20b4:b6d5 with SMTP id
 38308e7fff4ca-30927ad53aamr22443111fa.28.1739793390003; Mon, 17 Feb 2025
 03:56:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250217110623.2383142-1-ziniu.wang_1@nxp.com>
In-Reply-To: <20250217110623.2383142-1-ziniu.wang_1@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 17 Feb 2025 08:56:18 -0300
X-Gm-Features: AWEUYZmHvY_1XI6VdOUomFMuvpcQrKJqSxvERooJApcoU_Ugmh026Kvs_8J2YQo
Message-ID: <CAOMZO5AaLxmaz+c2z5W2M1SV+55pMmhKC2-oqt7_vh1TM6jr3w@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-esdhc-imx: improve imx8mq emmc/sd read performance
To: ziniu.wang_1@nxp.com
Cc: adrian.hunter@intel.com, ulf.hansson@linaro.org, haibo.chen@nxp.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	imx@lists.linux.dev, linux-mmc@vger.kernel.org, s32@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2025 at 8:05=E2=80=AFAM <ziniu.wang_1@nxp.com> wrote:
>
> From: Luke Wang <ziniu.wang_1@nxp.com>
>
> Compared with kernel 6.1, imx8mq eMMC/SD read performance drops by about
> 30% with kernel 6.6.

Since this fixes a significant performance regression, what about
adding a Fixes tag?
