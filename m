Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D1C412BED
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 07:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693289; cv=pass; b=oL74yQNCF0L3qsUhuaCoCMtRnFwNZQASgmx4TDxgIcJ/E2VoRgfFqLKSMsS1tryiCVCG/elEyCenVxI6pYGvyA/O1EdTjAS0hyPpSdx6j0DXjbypiJs3ohGYtaTEZx1cDx2VR0dpBVzmE4XyAPlLW1XXaDrmjz3LtEPa+Re4JVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693289; c=relaxed/simple;
	bh=W4o1ZmlBfyrCH3y2jdCkwEByqgWhppc/8xEUvhcD0rE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VKHDpp3hFZNqNkDIyucURFuQbRo0uQtXSpGH6i/lhe6KOnbhapL+uSQPUbrU+p95MltNt/e6npaglO7u1OD0aj6uO3zD3D346BNDdRU5FDjX30zV80Nt1eVRFKAkGqC0F6X+zjWbS+/yAGHK1wTiMh8MCZWwnZWXwsX8endxKmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=krglbWds; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="krglbWds"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3811f512167so881514a91.3
        for <imx@lists.linux.dev>; Fri, 14 Aug 2026 00:41:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786693277; cv=none;
        d=google.com; s=arc-20260327;
        b=dM2Pp6Ud+nJumLTSQClo7/tPrSMOw6pAE9YIGjXh1Kz2ud3WJ163ppW2Wkm2mu5ns9
         tFXajfCS7kKH682cB2VjNj817ruSKQnMv+3QUH/76sF1CuFpH0Q2tawnBCV2zMSHZQ5X
         Hoyi1kC+Jz0+uEI9UTeTlyn3jevqmRWnWfLo5kTm89lv115HMZxidgiF7XfGPF2DERgL
         OmG7kHlVBwBicdBdZKbLatYuEA/O4rHmYy1oc8ShtEFQDIZKLUbcN4LE65lhsgjDj5Aw
         cSUK7wigoiBk2s6FuPUsjSo0o79PwchBDJ98y8ZBf/x39JRVy4BtSbmsiW8ElvO5s1Hm
         mZJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W4o1ZmlBfyrCH3y2jdCkwEByqgWhppc/8xEUvhcD0rE=;
        fh=ovoc2Q+bV9EJb7USWXTtGZR1xE/lojeHZ2Ykph0xnfc=;
        b=hUYuAkaUyaC2JpMZAPJ1JQedLq4TxjVn5z6nULQO0Pnw8+Yz9/kMnZEWtf4fXG8hm4
         W10p/qJ/x2qqJgGDJcXbDcD3OVMDCc3G6A2KHCSUObSLmfT1Y4imAktLY3QVnZLnm1jz
         R6MVELpSziZcGXA1I1yGrK8rSkOtocZBtepJT+0o8RHcrT+wXRc0swdRYkVOGysARlIs
         Z7IcbzPz/bp4pp8euN2LiR7J0iWDlIaH3DMyH4W24WeJ24OWimA3iUN2ViAD45pzI+Le
         k03k2xPq/jX18/4IaymnIBLXvxFyEBqOgxKLMXRzCAzQehpC2TvrPnK8Ov1g9o2aZ6Xt
         6eaA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786693277; x=1787298077; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W4o1ZmlBfyrCH3y2jdCkwEByqgWhppc/8xEUvhcD0rE=;
        b=krglbWds8phKZFD8DzVXuFKiF/4SrhRsKtpvk6wflrv4mk8VNfPKcsC/m04GA7QxFt
         HedJd+Thb2UKmnPztoQ+33WkbV4DzKYks6ssfCENAL9kK33Iy5dQ8ws7qXwb8IC/FdOU
         yTZClhjlc+qdDcmIrtJbVqBFtdoX9yaJa5vegRmJ1ZW7pMgYtrUdWQ/TJFapFWfRNrw7
         Kx7DmJOzoxVWN+kXbvkPBVm5qNCJO1oMM0W9/IwVvkbm3wdTijWbn6bKdz0dE931XsTt
         u8kh61AtG0XBkXdZhs6X80z8mzuCN3XwUQPJWHSLY4FGsI2bxBiugVLMdIgHGr9XgF7I
         EZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693277; x=1787298077;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W4o1ZmlBfyrCH3y2jdCkwEByqgWhppc/8xEUvhcD0rE=;
        b=X5IOn64Z71JmTL43GYXfAe61EULgE7joDT3zzLx7HUHT8SUk9I5sc8pKASvUSc39ci
         u2edR3079iqf9esQjvf6RFzIJIcwccp9OkodxSXYfgZUFqlLx/qhRcOR1BOPQGApa4en
         njU9arq1hHJr4vJEdvXk/Jn/R6+iqUfHOCMX/hjjh0zluxG78j/0anuMv8DERNyqoPFb
         H6eR49n3X7qZTto1+T+lll+xFS+XjRCMKs+QVPT7X5pJm6+GrKKrkc6JHX378fwsLczH
         RpK9S6iMMl9wFXlDRBJcpXXayPH/f9vHYPp1Of7bTZ/lmRHuBvnmq2sLuddwRdQ9Tsmp
         NPjg==
X-Forwarded-Encrypted: i=1; AHgh+RoWOd4+jk0XlKFohWUdD5spbrE84co4PKsv3QzS60Qt2jcvgyxxOAIuR1A0rJlNznANpFk=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywl032SZcNmozWKur5Osh4CiBaa8RoFurchVygwtb+SDEPm7nwD
	rLkDM4NNSZ5SAACwO/jmfaGT/oodwna/hmrySEINEsFH5bOIYpStxxw41VEW11MzdQcmg47hLAV
	vqRIrD2pgmDWlvaCZ0OtObrxr2Yab7Hk=
X-Gm-Gg: AR+sD12hGc+IXyfyuAgUoAtaLWJDbfJ05tIzLakWwdsWFRBOqQsnm8ZFZdHLEwL8iCT
	63n6LGU51cYUtIj8Qauq2+CaLxprfvXUSww61nnl05MW1cMIqSX/b4KhSxzPofIgzSOoks4DSPb
	r1aluSjufbrs2Y4AWH0DSYeWOeHgAiw+Kpv+EOVIn4g1DkUYsrBXa9Em7vbOBIUN6vrfkgMrTDM
	35AC1BkBmkoATweUQT7tZ4e8VVjd8mMYzy87aJOWgeaP5hJz4gaJDtbfNRzu1B9Gf0nWzsR6rth
	2VbdNbfe1IbXwONd3K0tVz0/hGn7CcnWtwWAYqGBI1YOkA==
X-Received: by 2002:a17:90b:3d8b:b0:38e:1497:af5b with SMTP id
 98e67ed59e1d1-3933b77ece8mr4578497a91.1.1786693276690; Fri, 14 Aug 2026
 00:41:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260813070020.719810-1-shengjiu.wang@oss.nxp.com>
 <20260813070020.719810-2-shengjiu.wang@oss.nxp.com> <20260814-lean-classy-hyrax-60aab2@quoll>
In-Reply-To: <20260814-lean-classy-hyrax-60aab2@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 14 Aug 2026 15:41:01 +0800
X-Gm-Features: AUfX_mxVp0mCUmIh3cD49Kgp4iw4sN-NjfTifnUiJEeotRXNzWAYJPCWyxB1G3Y
Message-ID: <CAA+D8AOdF08PyOqQX6HTz-bWZmyB0bmKoW2DxYtnGS3g72aWrA@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 3:21=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Thu, Aug 13, 2026 at 03:00:16PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The i.MX ASRC hardware supports up to three conversion pairs (A, B, C).
>
> Each one or only the newest? You will be getting the same questions.

Each one.

Best regards
Shengjiu Wang

>
> > The existing binding exposed only a single generic audio-graph port,
> > which cannot represent independent conversion paths when multiple pairs
> > are in use simultaneously.
>
> Best regards,
> Krzysztof
>
