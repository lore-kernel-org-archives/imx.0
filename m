Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A33519413B
	for <imx@lists.linux.dev>; Thu,  5 Sep 2024 11:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725534211; cv=none; b=r0q04IkQ06wSk9CyL6GN6DCNlJP8cQWYZIBGvMxwQHI485cr9dVfzDRwhfZ5T80S7iSsLaB2C+zYr61mQjUfpiRfuexaHvS7fNNAnIT1YNASoOXEPqSXrQEyxOxqyw5eklBZNPvN8sMr/UMV51IIWF/d0aIDLpYj67X670ksG54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725534211; c=relaxed/simple;
	bh=eB+G/KoE/Sp6MpHzEecDtVY6ChnBLrt8Xtxuq7v/pO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MijBL5JnZBmC5qbW6Rq2kFnSiMuJnDcYEXCTvpGcXiss+MH7iqgyFhAo7Hzg18oR5bNevsIwGpQtyLpxScSxNhXyfb1KkDhZvLc/emmMTZBRoqqppWqxSt12o4BjmavKOQEoNpmObauc7bQ/7xL55LCsMTst7RxlaNnNFsC9FRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=meVsky0l; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="meVsky0l"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f3f163e379so11654861fa.3
        for <imx@lists.linux.dev>; Thu, 05 Sep 2024 04:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725534207; x=1726139007; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eB+G/KoE/Sp6MpHzEecDtVY6ChnBLrt8Xtxuq7v/pO4=;
        b=meVsky0l5Shti6qR45FXKvL6gbFenx2XNnCzCbCMjZGRo9aWMuMQh2LbN6WytuLNZ1
         2/4IA7TT2vbE8ZHse1ZPrZDrXUV+ZTgnLe/PvSZhErh/Kmv30zFVF8EFtC+8eErJ7bf1
         RUtgitZZvFhHIdVFTQ9gBKKvnnJyPnQ0iztbi2IZOHue6o9Weo9LF/7kYxqpJEmHcPYD
         3ddV3snPsyC01QZ2u1RVmVb0hMR2U4Fn0QtvVCnDoiLXz9UtGp53WFHnnXNpdbd25NoV
         RLVhZb6p9bL+G3wqIW7goHgwIuJ7WTf7/Yr3CKveRY4tYmuKh41qcY+Z+GfVhZxMouFX
         tpzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725534207; x=1726139007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eB+G/KoE/Sp6MpHzEecDtVY6ChnBLrt8Xtxuq7v/pO4=;
        b=CX7E2vwjnQYf98Ml/rNuDCbzybaVad3bw4R+lOCSR/8nVG2AKYM4vc0PgGk+SP4kVU
         3xzSx9FLkOmuwXUf/nuwpIpONKIOdVrEFYfx/6rtnwJDxLapZkjK37EW7Fb1Om+AKRC4
         t0Hz1Rc+43TY1FKiuYI2Il7QQRvB1xdprLz+Q8zdUvrnaTtTCqIF2RAQdxLBVo7Z2R2A
         xU4ipTbkXC5K1Eg6W7vPIoC4VxYQKU7Ae7fMttJ0ZD6bpVYRMve0MqI4eWR1xkztA6xk
         WocYk+G1f1OR77eSsvS/X4sLHQEANq7usYdX9dYRb04v+SuSUgdWdsbkzm3gKvB6kUPm
         +PnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVITgFy/K2pK4NLsXmZhNscth9RbQWMI1/dVcP7Gc42pvdPqG1/dV4rD9Cn4Lv3jP159mc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+x9v0HLHHbVwJ1CvOG8Zg29HuSQNGo/WHApFp8B5j2q5+PDge
	0msW1Fi17wOFEgf6saPxy9pvlxOF2+bsaDEa/9zY4z9P7sT8gFfMQONYBscDmeZ5dLxEs2pcNH5
	3KvwzUbEMqzRzqiDR9YNxhLsnvPY=
X-Google-Smtp-Source: AGHT+IEo/Ic/zOOjpJ9Dbjxi9FzyL8PqTsusjxm1xuxv5CE5PWatVWBpMl3LeV1nTLsxjlpv+UhzrdzBcj0VL5Zxhyc=
X-Received: by 2002:a2e:a987:0:b0:2ef:226e:e150 with SMTP id
 38308e7fff4ca-2f6108930d5mr227063151fa.32.1725534207061; Thu, 05 Sep 2024
 04:03:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240905062043.190604-1-zaq14760@gmail.com>
In-Reply-To: <20240905062043.190604-1-zaq14760@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 5 Sep 2024 08:03:15 -0300
Message-ID: <CAOMZO5ANhMf4vcotkcuh9+4VZrX+o+WXKJGTyppccdt2aJd4tA@mail.gmail.com>
Subject: Re: [PATCH 1/1] drivers: tty: imx: fix flags of rs485 not work properly
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: shawnguo@kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi LiangCheng,

On Thu, Sep 5, 2024 at 3:20=E2=80=AFAM LiangCheng Wang <zaq14760@gmail.com>=
 wrote:
>
> The rs485.flags are lost in functions such as imx_uart_stop_tx(),
> causing the function of RS485 to be invalid when using the
> serial port as the RS485 port. Use a variable to store the state to
> avoid this issue.
>
> Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>

Thanks for the patch.

This is a serial driver patch, but the serial driver maintainer is not on C=
c.

Please run ./scripts/get_maintainer.pl -f drivers/tty/serial/imx.c

to get the correct list of people and mailing lists.
