Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795347056;
	b=ZYuMR1sFjMQ8N39sURxcXBXdxiGoDmNz1H6ybh2rAJlv8jAn7SrahOtUtxVBq8Uv29ME
	 3uOUUSi+xcM6bb9YwXJJS1X94cT6xqDgOquJqKajqt2s8KhEEIA14BysTnCwjBBXDKR9+
	 LTPjIKsH6xxXbq5PLQYyAXAvfpZDBcIp7lki0wLhv+zlS2WMGICvl3xZU+Fmk26R4ggwj
	 NfQ0nsrr/qhSbpVnasJu64k6wbrok6x7p5J97Ur8V0mzy7gUNqNhXI1aIN+zGCI0Z5VQu
	 Mze4Zn6OQkEm3QLU1A65uDrvFjVPPABxDMYNUG+th6eO8RNc7dH3hrsvvWeNIH8Q2GA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795347056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HTIrhwJl/9ipJcdFd57QjcFO8vQHJXUr0hmcwxLC+cc=;
	b=GQW/bfmFumIWxySTjhIjQyfXpUogNkChsLWDYkLPJnKwxRYgEsoF7v3KZTVD7BBA6526
	 gsox6PJCIPpkOQxBclqCTtOXZgMNk4ZytLdh9zsChXGJum0v9c31RRMXinIWr3y67Ny9R
	 ICc/jejuaiQQHn8ko+rM+nZN/hw5YTQTCDPLFVooyX5vQLCkHOLEJohPST4fBUAIjoipZ
	 DGDytNZ5pn8hUNjNHt+uV1bnj4kA6v1UZhu/IWuz2Z+xKDf3LPDZ1r2LpfnfY3bt0Hbts
	 mqkGuMPFWf+wrxT9keHgfIV6txmiw98/mzWABg+EQEELsMvFBx/E3+fgTFXFipWD0hw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F6PGiZgY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88510606A32A
	for <imx@lists.linux.dev>; Sun, 22 Nov 2026 11:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88510606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F6PGiZgY
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ab3b29a1d4so17733691fa.1
        for <imx@lists.linux.dev>; Sun, 22 Nov 2026 03:30:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795347055; cv=none;
        d=google.com; s=arc-20260327;
        b=HbEWFnapiUklhZpXMoTabV2kv4wm+3gXbYkv1tRyBz47bTh8bIQFBSsoxrHpshmwuZ
         csRFC6gff/YswiRKJ/Vv0f7w48l1v70FKOUrExuya05B8/j1cbGwT4dMryN83jr/++Qc
         msrF5PpHR6/iU/x73qegFSrKYTUZuIO6XjUhDBRw2tM6PgEaPP2MRBuGT54XSPiv6oPf
         Qfz4zUlgQElMiFBn+VkrXBwgC08ZpoG5JAc7XlGYSaslNVyJjDQYQLyklQJVY+eGTOQ9
         DKEj9q3Tb4sUy42CQ88DxzXDzufpQoEV7NebKV3kZ3lLL04QjxS62+juo0tB7a4GyDl4
         wcig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HTIrhwJl/9ipJcdFd57QjcFO8vQHJXUr0hmcwxLC+cc=;
        fh=evTMuidSZexMfxvNwAZ50QOBh/kUdUfLvA/wSjM/PbM=;
        b=cbDm6KDuS5RGcYujRKhxRCSelTeVfDXGq9J84PiyrepWmciOXljYjgwhvVSFtoFoPA
         j/O7RP0YfwU684MqUjwIItngson027+LbZChZOQIbJE35uAHgYeaoSgA8cKWF+5D6rqb
         T8+mWM3THWJNNdC+lmrJvcm8Vvbc9RezaaDtswKVz7YPm+W4pA3htgh793my0JWlpjCK
         TnjnnGh933+W3epSDbyhiny7fb14cKoJaXEZZR9Whes9sXqH3vtfwkODRdVQBZy0+BfH
         UDmHt45dA8xpkwMVlEjYmT7yacbRqn1398PeXh5i8J0XCfU3yQEQOmB8DxEpuviDgZYP
         ETjg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795347055; x=1795951855; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HTIrhwJl/9ipJcdFd57QjcFO8vQHJXUr0hmcwxLC+cc=;
        b=F6PGiZgYthx5/wB7iJLTsCSFd7u8ulfHLOzJvl6GJcHgSy9WZw2i5t6U5Go+m26r/c
         V4Cvgnr7KJOW6NawREbMb29yPA4pSn8LJiaCpvJOXR0sfPHK7sstvPsgrjw1ljKPw+YI
         7tlZshRad3BrKkHBaeBsiVsV0vjwe87Yv9Jf157mXdKBSUdq8MPphb+zVqwlWalV3v3V
         oyjoA+YHbk2eSl3G/WVOSHUUm5Bd2QR20aVEEdxKV9hX7DQgC8BSC80c8hY7Fypu7ReP
         3Mexf34oVw4Yy2AaYSaYvELDu/QWRaRg3QE8seuin7+XNE41mHKAm5L7XikTfTfMJ+4y
         1bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795347055; x=1795951855;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HTIrhwJl/9ipJcdFd57QjcFO8vQHJXUr0hmcwxLC+cc=;
        b=qIEQJCRlvZXHbo1Rg+22LbSzylSYcIPqmzJtJjzM1Mmaz7zL1veBaS6cetZMm36QVL
         DqgvItUb1cRXKzoHoQ5mLhZOh/ggDOZQ7IbHZX5WJejo4ijQTJHylf88C5nlDvLG1sIt
         iLkIP8sya6zAFFaEwdpCQfgqKabdLbQVHqyAc9CH4gaCwT189G/LTkubFfJNr34OA4Q3
         CWQkPQrr07OhyZEM5S90nmm5BTZpPxhFH/rtVaQrp0YZ1ZamZ6gwpZF5OpPxCKLT12E3
         CHq/Q4ds2GlszQyVwRLend1nXVIjxnNog9hjV+Na3jLKqitpr0+7sNSy9Ht0d8icAQFH
         HU5g==
X-Forwarded-Encrypted: i=1; AL+hErEOLDgeLfjQxLsCs0HUzUhbXXM5VWXT5wHVlFtts68U9eXs/T7OEjd3EEItNazQfwsmOyA=@lists.linux.dev
X-Gm-Message-State: APuU4Z/rUI5iLw8BXzxTRysGu6ruq9QIRGx8aOiSbuj4HGfmWRbLJVv9
	DqhEsjRG8AxRx5sJmnZBTXV3tjc/L12vn8ziLFyUEkS64eu0zLvHV0nJIWiCfGJxFGjim2stkM2
	T3Vyg/mAU6p2yxK7qMkuy98mFUgddidE=
X-Gm-Gg: AZFdTZea8zS2XBnzVYQ3GoXnNO8XHpFaux27xortUgnh7499KFsdxpYDoUnC8Kfmof7
	hMU85TQKiT/zzQcoNudVIi4NwHqT+w/hmwahBAcvnmaqU6fddebscf4LPUYDs+2s0lsfnmhSyUv
	6yeOa+z0jUNrpCpWPLEHh1DT8s/zioMMnPD22Nq1/ScFLhZW5ioZ9UKn2hr5/LPkdzRUtdQuLaU
	aOrz6NlagcowluNA3p+W5xO8ZT6BYP7COl9HDhcWIXLmlsxITHxebSwnuRV1bI6LKPC8nybYAOS
	iQkAQj1p2O0cKRGYi50mdJQ5gSO9HYh8wNB8yMYfgO65iefSrJFvgkmvvrLMRNQhTvkvJ1iGpDJ
	nc1Q0uPsbKSSalcuzu6/4kweHRQR1zMB52Y9FZh9+pG7gN24FZw/JI5lIqYu5T7JpzS+jeI1oh7
	erBiZNHtRwUlCMI3Xk+AV7qv8j85G9FCdxNgKnI1ThjYD2epg=
X-Received: by 2002:a05:651c:a32f:b0:3ad:fb2d:a757 with SMTP id
 38308e7fff4ca-3ae7fa45871mr24883491fa.24.1795347054437; Sun, 22 Nov 2026
 03:30:54 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119134041.16611-1-festevam@gmail.com> <20261121231726.71aa1aba@jic23-hlaptop>
In-Reply-To: <20261121231726.71aa1aba@jic23-hlaptop>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 22 Nov 2026 08:30:41 -0300
X-Gm-Features: Aa3M54qp-5FUOe8r1ZuLPebMgOZXGH2Yo_N6UQqWLwX2mQ0uaPQ4PbhpovaTi3g
Message-ID: <CAOMZO5Dp6KYkd6=hsK366x_83ji9tdumq9k5tWXJGvW0EeRpDg@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: mfd: mxs-lradc: Fix interrupt order
To: Jonathan Cameron <jic23@kernel.org>
Cc: lee@kernel.org, maz@kernel.org, andy@kernel.org, dmitry.torokhov@gmail.com, 
	linux-input@vger.kernel.org, mfd@lists.linux.dev, linux-iio@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, crofts@kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

On Sat, Nov 21, 2026 at 8:17=E2=80=AFPM Jonathan Cameron <jic23@kernel.org>=
 wrote:

> This bit belongs below the --- with the change log.
> I'll fix up if you don't have to do a v6 for other reasons.

Please fix it up. For now, I don't plan to do a v6.

Thanks
