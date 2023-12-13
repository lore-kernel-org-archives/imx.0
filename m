Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5FA5FF00
	for <imx@lists.linux.dev>; Wed, 13 Dec 2023 18:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GF3HlV9X"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-551ee7d5214so2522290a12.0
        for <imx@lists.linux.dev>; Wed, 13 Dec 2023 10:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702493232; x=1703098032; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=62yBjsgi+zv0UBH+9qC3ziccvi8e4k04RuA6gZp2ubI=;
        b=GF3HlV9X+ZZEAsiIlZ1KjRIhPCbPlqk/Hocny7czI5IQK7ksml1esjJSIM6Nsmsyzm
         k7W+LQEkU/4j4it9oWcoMHUn/6KgbkdrFpkPxiCqpagf5c1uFeJ7yJYqC2aBOnu1n/0X
         PFVC7fAPyOghSc9dXH587hF90olarca82rXjLkdAtwTyOJryEcBXB0zhjM38Gff/hOJJ
         s3F/EFMZcBDn1XnTsrH8QymZhHTSUisrfzIIHda/r872T6xOmE82gFXxM+4R/L0XSFnQ
         IOj+UM5436TMoJWWhDaQA6heCSa9BjDCnVVF65q+CPfQNwVn0EQoBPD1S68gQNPq0pAM
         LsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702493232; x=1703098032;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=62yBjsgi+zv0UBH+9qC3ziccvi8e4k04RuA6gZp2ubI=;
        b=rqONgUdjueZPNmVYJKbAfWnt5ysjiRV6W5RWTlj2hinF3f6JSnmmTEGJsD1ZcgT0yi
         uScO4VxDesTHBJ2/6Vp+SNPF+FfWCN5G2R6Ps2si5i6FpHSdrv/DXGtTk8hU8wp0cIrn
         Lz/HkINuaWJCYW3LeUld/AyRGqn3Mqrui9lhjIz58DsU/XX1Kr4yZAcovuBxd9Vl0MUj
         yQL7ge2TfQsieaQQdSvcpZ8MhG7+vibpzs0Xo+N/B6E9I+uL+gMK5LWCxztylFVf8JWn
         Iel4wXI9DAB1E5KAYYbFxY1Tbj7OQFO4/JdEVCAtDVv1L7fQsAAHUOG3LxipXVZh+fFb
         +9Pg==
X-Gm-Message-State: AOJu0YxUQSzAG778FRr4aJwD+k8S8L6fJaPfHYOtt4eR78mesKT+C1PT
	wVX4Druvm50VBhKCm7Iawc7qM0stmFWJzo5pZenCaF3BrAZZGA==
X-Google-Smtp-Source: AGHT+IFjOGnlWpP9AbytLlyVQgYHx8PcwK62uIs/SkzboftaiLcNrod+YPbcKMB0vOeOluRnqCMSnwlaEuVY+E3b3O8=
X-Received: by 2002:a17:906:1c9:b0:a1d:1fb9:da08 with SMTP id
 9-20020a17090601c900b00a1d1fb9da08mr7037785ejj.8.1702493231744; Wed, 13 Dec
 2023 10:47:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Patryk <pbiel7@gmail.com>
Date: Wed, 13 Dec 2023 19:47:00 +0100
Message-ID: <CA+DkFDZeAV-XtdWe690RJ2Y=BCvur-LX6_Qqyntx0nJUKo2k2g@mail.gmail.com>
Subject: Question regarding FlexSPI controller
To: imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,
I've got a question regarding FlexSPI controller available on e.g
imx8mm or ls1028/2160 boards.
To not waste your time here is tldr;
Does spi-nxp-fspi controller (and Linux driver) support simultaneous
read/write transactions?

More details here:
I have two boards, the first one is LS1028a, and the second one is
Hilsher netX90 and I need to connect these two over SPI. The only
available SPI controller I have on my board is FlexSPI. From what I've
found in the documentation by using LUT sequences I should be able to
adapt it to the protocol that is needed by netX90.
There is just one problem: netX immediately sends some status
information (1 status byte followed by 3 undefined bytes) once the
master starts clocking, which results in simultaneous transfer on both
MOSI and MISO lines.

Eg when I want to issue a read operation on netx, I send the following
byte stream:(1 byte cmd, 3 bytes addr, 1 byte length)

MOSI: 0x80 | 0x12 0x34 0x56 | 0x4

MISO: 0x11 | 0xXX 0xXX 0xXX | data[0]... data[3]

As you can see the status byte - 0x11 (followed by some undefined 3
bytes) is immediately sent over the MISO line. Then, data[0]...data[3]
is actual data that was requested to fetch.
I tried to use spi-mem framework that is supported by spi-nxp-fspi
controller driver, but it does not support handling simultaneous
transfer thus at the end of the SPI transaction I ended up with a rx
buffer consisting of data[0]...data[3] only.

Kindly asking for any advice. Unfortunately, there is no way to use a
traditional SPI controller in this case, as all of them are used for
other purposes.

BR
Patrick
