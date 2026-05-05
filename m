Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CCB35C1A2
	for <imx@lists.linux.dev>; Tue,  5 May 2026 14:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777990581; cv=pass; b=t43cBU/3RonEWB9GXpTEiUaPCOmLzA9aaFdr4lmXwFekGaAOy3MQnKJ46i+VLQY7xl2qGrD6UYQK7N4EcRst5MBI28AKKPNct4aQ2VwAjjL3URFBidoFJeTtBn/WUEZMf6gkS4H74wzFWhvcgtl5NQQddoij4XAXUyB/AR63J/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777990581; c=relaxed/simple;
	bh=EZrw+Ff5wgZp12c9wE92Aku4Sa+D6FECWmw9grbidJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Awgi43PPzZmJdpdGeNdbLslxWwNqposD4yycgHwrmf6mkcpmATNm53JitwsTJ49OgnmVpXUb8qBnREEd2jVd1UGDLa1VNToqlUX7ngwGUVFbVZ4vIjwuRGtMrITtl/pz56SEnqznjfpPhfUYjAmRsm/Z5YRGNIyxa6J/fF/5Uis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=LqlgOOCL; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="LqlgOOCL"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38def541b0bso51239511fa.1
        for <imx@lists.linux.dev>; Tue, 05 May 2026 07:16:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777990577; cv=none;
        d=google.com; s=arc-20240605;
        b=RpdeGv8AuXK9nOt16s4bvkm0B5tvNHkY6o6g90Z1QU8LKdPLnaRo54wPMJL1B6zdfi
         Wmgecp/bYJYt+5sY4iTfEvDhdkRU+xNnDgSwGvRKxEROz7r6e2uAx4awM7IelV0F4Dl2
         0aRYAp9q3Xcu7FixGAqQOSa/IX2hVOHPBFicsQceF0Nsbi/EXxJ20raXUeSpL2skj/AM
         hd1dtudZhZfyFZ8RESz1EjJa7DaxqSxS2q+xUc29Qa2F8PkiOjugoIs0S0Todc2de44Z
         c0Dv7Vh2mD4fDyUQMLk9rSqHFDj+ISVmb+qkilPgLArPQO0+hpoZQ9mtL8muRUtbDucm
         YN7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aFHux40IRBs1/yWZDcql5ry1rXvUTT6afmUx2GtPhjQ=;
        fh=BEHCLLJ2obCbTfZmAgT2QnvVVRTXOsIwW2LkKphhjFM=;
        b=Ir/3QWPHe71eh3OngETrfGBZcSn4RBU3XZScCF5vR5IDrxqJboYKC2pVviJ1h0Mk3o
         yVhx098p1IcYqtehrCuhy2R94kb3UmuEhtPChg3sxj5R11gQ82pS0kqmSSqTvLC/tcK9
         6QGyi5rPqp5cUtwXFOmg4ueDzoG+jzV2BcgFvSfrDKcgrpB0wBY1NPzVb73qjjsWTrIz
         g7ufhaGAdDTOD287GIotYg6RC2DhyfWG5yekrOS42ZQEzTSJD75jY8GdxA4HRsl/zY4b
         01k4ev9tiyLeVrz7Yn6iMsctqlMmcVFyAbOLJuzbezzdFpPYi36JuURymo71UU4/S2Fw
         gxew==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1777990577; x=1778595377; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFHux40IRBs1/yWZDcql5ry1rXvUTT6afmUx2GtPhjQ=;
        b=LqlgOOCLNi5KOxHNz9PNFGiHszsiKidf4GA5wq+T+kSWjEiV7ys4nrdMSY4a0aPqw8
         gaDx8sbswZKokWpNCCPh/AZcdKfpkJ8Ehd9dx4t5qkR6set/BkFfUAIgDFBqyUHsLqFz
         Bpz8TFcX69wpq9ENawq6Ksofa2eCNR76mx74M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777990577; x=1778595377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aFHux40IRBs1/yWZDcql5ry1rXvUTT6afmUx2GtPhjQ=;
        b=qKvL1bWg64QebiX7uAEkJnr68n9sg62IfWSAg1KWD2/j7QZdyh6fxxwNgDqf9LUXwk
         xUgHoPB7ABorIBtCtaCw9bAm2w92kBsRNVL9nnedtlLYaMURFdIXsKA2rKaUrGgiPHo5
         sOtcF0ju+Yf6dRu7Tk6xzxoGIAgJKKxow7H3SrDd+9dB2HZriMJkIgWWaAp4ywuaqyeS
         tZDW91uKwEeP7B1WhLDwj0TPx/Tzz3b5Jq3Yph1lSvkfB+xdRx1sK4rSk+tYSDJSqiw4
         yXV5NMwBj32PWS6HGAuqDlv5bQaPNDo/+cu58dbKpJaiu0fibSI6hSmB92OWl4khk5va
         /aqA==
X-Forwarded-Encrypted: i=1; AFNElJ9iPHHiWOaMsN4aX50oDn/aYo/2TiUnh9BbwzYbfbwdeSQWxQqcAC4btCl1d5ZratPZtpA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyBKlEVgMxJpQmMamG+W9s79HJ79ml54bYgvjd9O7BJ29oUSNgZ
	dLSC2oeekpYqSl9GSXqDPfYdGM83b+nI2CgF/i3v5M+SmbjENyDX5Cjft3oBtoipgo8VnooUQj/
	I4eGwotgkUnZqbneO1bv2rbBn/+PVAUwt19UMcuTwfA==
X-Gm-Gg: AeBDiev3KzDrzTT1xKRBZ1tJToKxUHm54id/2jPQZY4gYkFt19FAeGGj6nKxRQ6mSY1
	yWTM/w7zgdeJ4SBOUZaZ5VkuXbz1EZ/q4CQ/RC/QZ0GYx56x0X4BB8OZ7af2ywSWwEdSbDoSQ2Y
	qwcRTQxBD+oOqDkU6Rk4cuG+DFpU0lpZ+N1maBTZpLLSZ0b8ClEniKfZfCOhAUP5BpdluQRcW1p
	CWAkVrO4VgbXqBbhCj92dtslcizd5oXT3b4x+mtbCDqJ4sv+Q51Y80SjhwzRbySxeCQvcH85Vhy
	YjiM+xTMyfN6L4E6+Uw=
X-Received: by 2002:a05:6512:238e:b0:5a8:64a4:2bb8 with SMTP id
 2adb3069b0e04-5a87f1e9f56mr1369841e87.23.1777990576919; Tue, 05 May 2026
 07:16:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
 <20260430132140.30369-3-r.mereu.kernel@arduino.cc> <db701e8b-a405-4105-9b5e-b2add3827d83@oss.qualcomm.com>
In-Reply-To: <db701e8b-a405-4105-9b5e-b2add3827d83@oss.qualcomm.com>
From: Riccardo Mereu Linux Kernel <r.mereu.kernel@arduino.cc>
Date: Tue, 5 May 2026 16:16:04 +0200
X-Gm-Features: AVHnY4JUaPaP1Nq1wsangmykEfeEzNjOrLYJgeSdNs9jlx43Fmpe3DuNJWlc_mY
Message-ID: <CAKA1JhbaB8NjHE-Ez98d1b2QaBkrvpndA0d+GfbZ+uHW1BXruQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: qcom: imola: Move analogix video/audio output
 to dtso
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, broonie@kernel.org, 
	linux@roeck-us.net, Jonathan.Cameron@huawei.com, wenswang@yeah.net, 
	naresh.solanki@9elements.com, michal.simek@amd.com, nuno.sa@analog.com, 
	chou.cosmo@gmail.com, grantpeltier93@gmail.com, eajames@linux.ibm.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev, 
	m.facchin@arduino.cc, dmitry.baryshkov@oss.qualcomm.com, 
	loic.poulain@oss.qualcomm.com, Riccardo Mereu <r.mereu@arduino.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 4:10=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/30/26 3:21 PM, Riccardo Mereu wrote:
> > From: Riccardo Mereu <r.mereu@arduino.cc>
> >
> > This is done in order to support different video output over DSI.
> > Since audio part is linked to Analogix USB-C controller it is moved to
> > the same DTSO.
> >
> > Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> > ---
>
> [...]
>
> > +     sound: sound {
> > +             compatible =3D "qcom,qrb2210-sndcard";
> > +             model =3D "Arduino-Imola-HPH-LOUT";
> > +             audio-routing =3D "IN1_HPHL", "HPHL_OUT",
> > +                             "IN2_HPHR", "HPHR_OUT",
> > +                             "AMIC2", "MIC BIAS2";
>
> The commit message doesn't mention wiring this up, please split adding
> new features

Sorry for that, part of this is in a series that I was sure was added.
I'll make the dependence explicit in V2 cover letter.

> some of these have a double-space, please fix them up
[...]
> Let's keep a \n between the last property and the following subnode, file=
-wide
[...]
> 'co'dec < 'cp'u < 'p'latform, please

Thanks for the feedback, will fix this in V2

Best regards,
Riccardo
