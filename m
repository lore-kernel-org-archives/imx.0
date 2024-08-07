Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C887A79DC7
	for <imx@lists.linux.dev>; Wed,  7 Aug 2024 16:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723047072; cv=none; b=pHcHq96f81PMFzj3AAoiEWEuMaBPthSs67kgctO6JKjntLI67hRoHqCjx89YVBO06ij8Q6RG+5cNMoSmln7iRFPsvaiMcgttF7LgoanW+QE8oB+rlctcAPQ2uSeaUcJYRqPe0FiedeKMws3R1F1AzeHpvVWH2cmPuO/D+X3jzZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723047072; c=relaxed/simple;
	bh=7PYhDLkb5CGgKvkzWQlcN4kr1/hoOgEEWyscq7uwhBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lCgJXbsBnJaVKccN/pYTBUtjTPQcL6LbGf3AqwnOSSDshbzfOWsnoZNAszjqz/qYK7H+dDKUlqKUk/vPagBcKv1MjsVOZY/L7zfvyQ6JOmfirsO2mMqBVQkAoyaWerCfADE680wa8/AvSCiGKnPoeSc2dTHw35cbWhsbVm3Fwa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3kPjmTC; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3kPjmTC"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52ef9bc3a64so292953e87.3
        for <imx@lists.linux.dev>; Wed, 07 Aug 2024 09:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723047069; x=1723651869; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PYhDLkb5CGgKvkzWQlcN4kr1/hoOgEEWyscq7uwhBY=;
        b=U3kPjmTCrt/0t3WpyuVJgvqRq+z5Tt38C4BaK83+ootrJIdxDY/wstSZbI4Gd5VeOa
         Q3SarC7ZFpwjVuTvO01635CYTaJbWFsyXM1vAoZl/Xe/bBQo/f5h4FV3dLC/UyqkxwZR
         MqjhX0kvtlSeqSl3mhSXSxvDD5sEBWkeTJF1mjPfLNNzsQp9MinX0KK6QWPtWdeWdzFp
         1MPD+1o/stgr2SpryZUDzIWBAvjNJRQLjDbEd/zeXn2BplQ489quCapOzbRzLD5RioNg
         OQ3yzzJ8qQsrKgwvdZflYU9X8EiKB/V0IblpxhghIcI0y4Xa7LReSeZ1ePKV1bagD4eS
         ZkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723047069; x=1723651869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7PYhDLkb5CGgKvkzWQlcN4kr1/hoOgEEWyscq7uwhBY=;
        b=nitMkcBoTNVTLzp2MmdUv7KgBApc/4qlcoBmHy2lxON0FeSOTAJReja18XDIro4DZ6
         8Le2D5pjovzURUq9cFwu4nVsPKyb4AvB5A0eGMkYhZTmN+ZKMs/kFZDxa706Z+19uMT2
         6JUqK1r+bpMz4cizfL6fTqzqQQ+x/g4PwhD6si5k9Xos7EaWyFgmgqnWmUhWjnklAtlM
         o6N2rxfC3S/ZI3lscL7sYn43en31sPyLzS8/O89KXw4R+foPJ2+FvY25R15KMlUBDu+t
         r/uTKRvFK9nH8wcZjWLODNBuOx5pZSKo72aW8qUc0nGigQ5MmqSup03vcPSRtwa6a2Dk
         XZGA==
X-Forwarded-Encrypted: i=1; AJvYcCWUnq2vOxC1LirLCiD4D+TIGSuoFMEbjbl9qSjDRjLUOiY89TGQKoZErW9jqBWaD2XHhpVa7cQ3vsYgIDfDExlkUv1m
X-Gm-Message-State: AOJu0YwACP/S3/nwvp77ZfRsJYVxpHd1rI8aiiRQMdbCj5X2ZFWYp0XG
	/YDwixyr0ZrUDV3PS6zz4IizJ8yc26iftMgp/+iVONF0bxP8R7ZhvpY7H3RXb9XEJ7DQCIK2gVc
	S9CkUdUJ/EgH3vjKNEM87XmvaBEo=
X-Google-Smtp-Source: AGHT+IHox9JCDaYxyNIZTGdSOmDp4HMcrEkIpYcD5GhRVV++7cQDvoYE/rWhIq9QG/msfeowwn5UpIyCKEG2ETJ1dw0=
X-Received: by 2002:a05:6512:39ca:b0:52f:3c:a81 with SMTP id
 2adb3069b0e04-530bb36e47dmr6914029e87.3.1723047068457; Wed, 07 Aug 2024
 09:11:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240807-imx8mp-tpm-v2-1-d43f1e8f70ac@phytec.de>
In-Reply-To: <20240807-imx8mp-tpm-v2-1-d43f1e8f70ac@phytec.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 7 Aug 2024 13:10:57 -0300
Message-ID: <CAOMZO5AYRgao=1i1hnLCN1ZX8G66ysphykeikoDLEb420vs3pw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: freescale: imx8mp-phyboard-pollux: Add and
 enable TPM
To: Benjamin Hahn <B.Hahn@phytec.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Teresa Remmet <t.remmet@phytec.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Benjamin,

On Wed, Aug 7, 2024 at 12:18=E2=80=AFPM Benjamin Hahn <B.Hahn@phytec.de> wr=
ote:
>
> Add support for TPM for phyBOARD Pollux.
>
> Signed-off-by: Benjamin Hahn <B.Hahn@phytec.de>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
