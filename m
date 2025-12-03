Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5229E299AB3
	for <imx@lists.linux.dev>; Wed,  3 Dec 2025 09:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764755694; cv=none; b=bxEJJ7/F2E2L1bVpbLzmi3zVSFBPuCnnNFP9IujJWzZyj3w+aXv3ttFY4mTOn6aP6kc1lfMp5At3yxDcIbHzzSMdffU5WTwca1/H6tkl9VS4rx9wfAqsqoJBHqwZidmRxpZ8y7zkvn/db/WddY03Jg6XgqsN4b+4knSffQn2FQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764755694; c=relaxed/simple;
	bh=f0dqnFUxVAgOq5yOpOOqeQxSwqMfw0XwWJ0/CitF0RE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M898lt+k2u+J3UvBsBvk8uYviPS9un1Ext3R884vLW5m1uf0bLCOT0hFM43jnRTA2An0pINzZRGjoMs5zXUwpmLaeT5fT22OIsgCg9tk6dIhN3YvjDcUIAB4usDMzRx+14n3CFEWuKBqZJq18g2Hdqe4VkPrA6idAY0F+0TQdP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fISw/HnX; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fISw/HnX"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-11beb0a7bd6so857805c88.1
        for <imx@lists.linux.dev>; Wed, 03 Dec 2025 01:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764755692; x=1765360492; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0dqnFUxVAgOq5yOpOOqeQxSwqMfw0XwWJ0/CitF0RE=;
        b=fISw/HnXHM9B/ILzLqdEy9eItE4ZFdAXYX3LT0rDp/MInjVgEeOtbsX724jH6GjyKl
         PLReFK4WCDZThS8/VlSvFCLXR/pNwX9JIpcpF2v4LnlghfhYBzQmV/Tj27I7kA6Ka5/f
         L/j/HfSYijF2NR40Ct6LiMnw7V8bTSQHiVYunlDSZJQu2qIf5QaZEWzMJl2u9vDnUrT+
         FBSABYaRUFC7O/m5RnvxLmx82RIR2Pv8BgU149f4L6KOIlzk5q5KJ0VXmVqwT1cJFFub
         4uwMrx1mQ/JrzVyhEczPvjfSaMw8elVDx5fVzVp/gXeowzZGqJxu9dQScwSJTOcI+aSF
         dqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764755692; x=1765360492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f0dqnFUxVAgOq5yOpOOqeQxSwqMfw0XwWJ0/CitF0RE=;
        b=Zb/4P3dK6BWFUas8Y2F+AFZwKA2eszYOcNI8hIVnHBIjnd/8oBhrVshOC7sYyMEMRP
         X5aae5TrC4+M+QVK4Djp4OtJs/GeiptgRux8p5aPPOEAJRG/B+dCvp8zwdtPT14KRbvb
         dC1UwvkHd6U4x+986Ptnolk10chAvV+teGybOgRFrbPlmiZGDdREzG6VAksCTbuLLqAV
         Mo0QcA1rMUOigvA0HEqh34+MMD1zGFm+s3rjq0aM67sq8erdLIrqpWJalM+0p+kmS2F7
         wY1oiPiSd5z8irgfT2L8IP2KCePeLgIOz/6p7h31P24h5odkCmlomWLTyV0qlBhlYeyC
         Zysw==
X-Forwarded-Encrypted: i=1; AJvYcCX9j0goN4+/BNFWLyicXjoOpizHSpKNYkRirvqUfDdosKNDdL9FYi9iTbCoFfpaIjM7v2U=@lists.linux.dev
X-Gm-Message-State: AOJu0YzII6+OQ/ZTfpMyOchmmgND0Q9V144ioWzx2Ga3CpUav8ziLknN
	XDUcFmSYnDtajzgwYlxjzweNBBwn7xBxDSRY/y3IGpAwAVKfs/WkoK719mrZFMMTFHOGk0Hnntd
	pNGbXWHuncMqzbyJTN9RiB0ErlPMX5VA=
X-Gm-Gg: ASbGncu+tqfNZH+AUN7NjEnoNqoM6M4Go47ZO4ETGKlYMBAiiH1rbJcjpuiy/O8Zt+y
	yowkMF2X+s2eApAIf3NulzPkt7jX5FmuBT99rFTndrK5TXcLEr1+aurvhHJxiF+FNambb7SmbHE
	OUZKag/gBmIDNzAKQ6xeIruI8JQ9LRTl8NMflk0FLRzohAabvhCOuvVasRzACyMwMbA+hujXmiA
	qsWV/MrO4dSRd/eGAhFk6Vc34rBjOrH1We0TrBEnSdjU5JbP5zUKlJDstEFTg5dFm3IK1VdWe9N
	xMuj/pnxX9+mJINc7WzVZkcmmA6eJV45yXO4F5QwmBrnLDBtAkCROqAYnxjLTzQhwvOdo8OinzH
	++kcXeQTMlw==
X-Google-Smtp-Source: AGHT+IGh1q4mLj2gpybqPMtTKo+p6UyebY12iwCECr8rP8U6hfyWr+Vocugi0CQjhYnT/XilGYRxTAhtqzRWz5addaA=
X-Received: by 2002:a05:7022:1287:b0:11b:c86b:3870 with SMTP id
 a92af1059eb24-11df0bd8024mr1582589c88.4.1764755692362; Wed, 03 Dec 2025
 01:54:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251203070605.1868821-1-chancel.liu@nxp.com> <20251203070605.1868821-5-chancel.liu@nxp.com>
In-Reply-To: <20251203070605.1868821-5-chancel.liu@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 3 Dec 2025 11:57:24 +0200
X-Gm-Features: AWmQ_bl25_jqrQMlyIUwjWkr8w3cz7Pw4t74hPJrR4CZs7y8Sk8Qxgpyr61aeU4
Message-ID: <CAEnQRZDDLKyU9a1HPt=V=WvEmfOCsEBPd2zy8FWaKUAwUr5New@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: imx91-11x11-evk: Add PDM microphone sound
 card support
To: Chancel Liu <chancel.liu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 9:08=E2=80=AFAM Chancel Liu <chancel.liu@nxp.com> wr=
ote:
>
> Add PDM micphone sound card support.
>
> This sound card supports recording sound from PDM microphone
> and convert the PDM format data to PCM data.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
