Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE64365A1E
	for <imx@lists.linux.dev>; Tue, 13 Jan 2026 09:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295258; cv=none; b=Gc54ILaZokDqtjm2xfaqSMw3TT6YRjgETP38GPnjAbfX4EC/WVih8u7Hf+Y526bbJJ1PEFxDy9qYQCiSpEyZkQPwNGqaVyFP52yJv1VaXDwQ+EGQJNE2s3KR1CUw7YPXKMohgQyeNmSPKBGWj8nnm56KxE57qcoSM5wP4VNmZ2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295258; c=relaxed/simple;
	bh=koPjTBX4iK9OQ+Ff94Uc6fblTMyD4uSDXtmNeEAxpE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I8IJZrSOmz/smqN0l3x/Uae8DV820vH+tCygmqxTW5EvdRzTbZgsMUrNAw8k/Pj0bPS+A2qGa1vzwcxttfsoUEIABj+C6kaK4Oxv+DxeSX2fZdifCA/GAQqZDwvGmTVTvZ9N7rmBrCHi0rQxibqUMya10oUIsXV5rbWBuUWlzPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fS8n2Ruf; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fS8n2Ruf"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-11f1fb91996so12161584c88.1
        for <imx@lists.linux.dev>; Tue, 13 Jan 2026 01:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768295256; x=1768900056; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=koPjTBX4iK9OQ+Ff94Uc6fblTMyD4uSDXtmNeEAxpE0=;
        b=fS8n2RufknwFzjqfaD6k4dD8qiLm0BYiolp78rk/1VI2aG+V0nHBaY64sSmJlgUFor
         z8L7ccpoxk3wd3by93GW4QV1rs9iC9yKubz0YQ8JSlOWxTmbLEA6vxkuH99hrKbRlF65
         NNZkCIzv9PWCekDBb3Aym0PA+xMnOMBd00LbAeUEN5JF6M/lEirw5FpF8pTTU4DDgP75
         JhzaSBF45+YxQh1PT0GCP9pKJ413v5n3pds7aUb3ooozzgnh4oDpghtPL5ioP2npdmdq
         zbRVsjeNujDlwdZFcvVVT8Zyt72Q7mdOnmc7e6fkCxJGTbPfHcFiwThUVaDrmr6xoiqV
         ykDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768295256; x=1768900056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=koPjTBX4iK9OQ+Ff94Uc6fblTMyD4uSDXtmNeEAxpE0=;
        b=ndyr/GeNah/i9exTEgjNRVLTBHN4Zlqu9/Tt8Y1IVBM7KLZIiqizItoygn1K47MC+W
         2EaGC9kk/kEobxfcwKfqy4ut8iqffipcuq+fgq77v1YUTdcM/iFKRh4+yc+TePJ1vuOx
         O0Z/oAYeSW8MlHmfdr0UC63K7bHv+UODcE7Ei/Nkoar7Z2QTvTHWCea8yYotvF4Ef67l
         QGkx+MPEUPOEMddpqccbkbnhWcTtoJlSIBuCfExPC0N98hH6PwMZYMjPZUWa+NHmMe3A
         9DEZ/mhxO3OSOYtcRUavZgJ8fIRHh09XfkpAhj57taY4lxoo82QWdfcBggVfobaLrVwP
         93Wg==
X-Forwarded-Encrypted: i=1; AJvYcCXyDcaJ4w857rHAJiHSo5ZNO7haD8qGek2WSZZ8E0OJv9HrVTw9S9ZaBzo71SfsSIV5FGE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCUtRm2PljsVcsGZFcP0fGf9jNCQ4SO8X9yVt43RPJ1EmJe7cB
	+8MR0ocB8qXrzLk8hi+UB6yU90FM2/QbfTA3F20wpLKCQgg9E3M1iuxpiqg1qBEJj9UEowVsJpc
	DVqsngLUnkoACKtEs5Q1YiVoBs/uDpfw=
X-Gm-Gg: AY/fxX5u6NvsjgTFz1N0dET0l+N6wgG0XW0F4lI3xGwoKWe6Lu2SLpZqYVSLjRN8bjL
	Z3BgorP5wcWv2D2E8euyqM2h8hymXbdMpMAYNgxJKRF2EulrDrcj1KAViHlhRO7idXvdCpmFDkq
	jW/sUx8MIlH0clDp2Y+rtJgzxXGrCsOf3p2ZKq3OT7urkWhTZskARsL5K+3qM8Ermz6susodvGc
	NsDEUokD1BbOceL8fQT6LoPdKYzcDqAC9hQtPro25Aw38KX+JnhlFjYfKi/lYeTuOVaymxGKFcI
	kDGQQl0XVuuQhSJJH1isd095HIT6rgsqP6EIZZyB8NYVMN1P8/mB9wRi/vFtv+k1KP6INCKSOhi
	0/PYiIn2Ycg==
X-Google-Smtp-Source: AGHT+IF3RX9nAlZTR2amE9GxDzDwPqdE7Cjqqbe7GDtDpeVioGO8As8gNYcnkAyF+8R6p5o6StJOxLoio/8dQb2c+Lg=
X-Received: by 2002:a05:7022:43a0:b0:11d:f440:b758 with SMTP id
 a92af1059eb24-121f8b450b3mr24817667c88.25.1768295256086; Tue, 13 Jan 2026
 01:07:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com> <20260111-imx952-dts-v2-v2-10-5773fa57e89e@nxp.com>
In-Reply-To: <20260111-imx952-dts-v2-v2-10-5773fa57e89e@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 13 Jan 2026 11:10:04 +0200
X-Gm-Features: AZwV_Qg-q7k5jyzvnB6ALn27XAuNQ9bYa59uAz3y6dRfMLXSzH7lkJ4OAjmRmcw
Message-ID: <CAEnQRZCKAfhDT0p+MFjdZ+bLQJad1Wm6YT872FXyWB63u=zegQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] arm64: dts: imx952-evk: Add nxp,ctrl-ids for
 scmi misc
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Add nxp,ctrl-ids in scmi_misc node for wakeup notification.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
