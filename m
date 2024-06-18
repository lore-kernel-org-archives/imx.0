Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB6BEED8
	for <imx@lists.linux.dev>; Tue, 18 Jun 2024 02:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718676324; cv=none; b=ZnOR0VZB6WxpvZzw4YXAErGZizp5qnZqUlyVgLzLqW4AnV0AY1NL/0skTX7NtwFIgAF4XOX5sAl5Vav3EEUb7V8uRNpzi1kJdg2WpTLtx/QfZTGI8Y/+XbDtEryAs9QCM1cT5k6ZKqfIiehrSURjD+VU2TA6icf8Rrm4LXeiqVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718676324; c=relaxed/simple;
	bh=H49IrqUDcg3thpDEGnSkFiRW0yaw7ZnZfWWUN/Mp6Is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yy/Twgj+Gpxq+VD8FSv3gaEgx+Ir9RR6Wfry2ehfLFy/SvCj0f/CbQlEAwgmkle6JYnI5NkqzPXGU1pSCCZvlA1wK7mlSNtuRj6PHDhL8mJfsKCrc3nuJf7b3LqSQGkOYuUsRI3q8qlvi/rTfJOpSLShQ45OIg7A2vsIUs+BLkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QpeLx5yE; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QpeLx5yE"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2c4e2cd931aso696843a91.0
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 19:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718676322; x=1719281122; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UC4CCPVGAK+nftSKrL1x2cOea/22VgZIo6YoyrbFDH8=;
        b=QpeLx5yEShpantA7wqINye6YLGvliaOunHsjcKdB0aw8mVShZKO4EQUosjY57kw3kc
         kB/tGVEFd7z9jxVf3yydBOC1/7mhR5LY2bWS6h7FUzuEbtP/v18E1/KVyTE8EzVBy1dL
         ARHJOSrU1W6sQwzF1V7VebxvaoVG9uYyQeBhu+i8HVwnwgG7FSCgMw5sSvimehsFZBrJ
         a0haAjCrJRpxZdbRmyqUP+zEpUHmiyu8fkoy/xhC8eD1rnOaKVgx8hWsFO4P5rfbghS7
         S8ES0Vn0roRfAk0xLXHfcDbikUne5NTQmjvCIcd9e+MYjr0n0O5Iyo1hm+Pd1IolMFi8
         Pf0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718676322; x=1719281122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UC4CCPVGAK+nftSKrL1x2cOea/22VgZIo6YoyrbFDH8=;
        b=O155JfUyNgZtjIxppBkxle0YYnA6dEXB3x6FVA0h2XX6ODoz6McF7lYBRgPRkOrHXk
         IQDu0RQJ5SeoKAsj/yxTosbL0/UrMyqf8olKjl/EWyoAoGzkNXCfIjojFglqauerpdQw
         txLeMd1OcOMBXLzMmRjGgK/wZntLcBC5+KV9E+ErzHcQ4t//OmNZ88gZZ4qvQwjfWezT
         dNfb+2UfnzsHXAFoeZ26TgE2Yy1CIkGArLQtnyIZ9wLwppvOHhsmB3vAW3qmOqHiDmF3
         bP63E8n3nqlxUaw3AU327Lik/WO4piH4ssX4DNGyQtEcQATe/pK0f/B2R0qwzWhFpFFZ
         3hwA==
X-Forwarded-Encrypted: i=1; AJvYcCWfkArSmUMC2T19Rhue0TvwfHHoP2rbV3FmnKIXYihHr/zLRYzL2O+6I4kTRuzOBWG4PUNTLh2x+SKgvJh7o3wnDGZ0
X-Gm-Message-State: AOJu0YyvpoD1d/bpRDD5mFkgcLmH8N6e8Ig20VKzV70M3vrU5TS6iulm
	SOBgX2AmH0TMMqLpfbFmDrFpKoa4lxNXpJP1mMLlINuNne57yZy1+ymO0oIjIw3vlUrBhVp9vxm
	ectImvj9/cH8M/z5xBkbYU2nnr6I=
X-Google-Smtp-Source: AGHT+IGgeBKXqH2kvONTccEkgODfF9O9I+AblF0WWQlymfGDP4JfA10Y88jwvdPmqB7Trl+X1SXo8LhJrNHDFFvMR4A=
X-Received: by 2002:a17:90a:fe0b:b0:2c3:42d2:ca91 with SMTP id
 98e67ed59e1d1-2c4da9cb5a2mr10866239a91.0.1718676322329; Mon, 17 Jun 2024
 19:05:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240617223100.1539796-1-Frank.Li@nxp.com> <20240617223100.1539796-3-Frank.Li@nxp.com>
In-Reply-To: <20240617223100.1539796-3-Frank.Li@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 17 Jun 2024 23:05:10 -0300
Message-ID: <CAOMZO5CwaXVzkJY+TP+JF78mv=9FfO2v8cFwXNiSNp+_n6Yk3g@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: imx95-19x19-evk: add lpi2c7 and expander
 gpio pcal6524
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 7:31=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> +&lpi2c7 {
> +       clock-frequency =3D <1000000>;
> +       pinctrl-names =3D "default", "sleep";
> +       pinctrl-0 =3D <&pinctrl_lpi2c7>;
> +       pinctrl-1 =3D <&pinctrl_lpi2c7>;

The default and sleep are the same. Is this intended?
