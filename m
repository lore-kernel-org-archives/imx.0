Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4793626A0DB
	for <imx@lists.linux.dev>; Mon, 22 Sep 2025 20:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758573811; cv=none; b=EYljqlMKznZBS4eoHgZoiYCP5LXdUlAbSuWYWCcsxL3KWoPJSD8HuBQX24xyoUWFhh/5SSfs8mf/OBWhTy+DNscjMyzE+SjkYTNJW19pz2/9PsJ5eOfRnyzLrZ53p5Tp/RQazxv74zuCuhCZamqQu3NyMRJgGzYHLCU0Pc3dE6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758573811; c=relaxed/simple;
	bh=8mdyqw9MjWOGNhllxvabr/uOzspow8KWf8sR0D56cCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V9KAHXNmeYKjCuHxNM90dFPJCLKc+yrKkp0UhwccfAb0Nk5y6mk8g4hqjhtXbYeF6hyLZ47jnpFSF7DqDkpdEARRYwO+yZ8AZiopsb1s0UGvJb8i0Bvrsqrk6M9G3VNyuWtTShdokP8AgJzaYXb7ctcwDv3kREFqhqdOr+5FVt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxLcHQu+; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxLcHQu+"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-57d93a4b5e5so1880649e87.3
        for <imx@lists.linux.dev>; Mon, 22 Sep 2025 13:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758573807; x=1759178607; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mdyqw9MjWOGNhllxvabr/uOzspow8KWf8sR0D56cCY=;
        b=hxLcHQu+HI03eTG/Z+/nZXr4wncdamnorEgKlhBbV7Va1tZMMOQI8rXmGCO19gjk8r
         WxQMSlVpUnGg16u/pAGMaOOPl4/RhwcxHQT5eC7wNe52PUPwLRTn2tbNFlA05b8Kkl6L
         8mHZ3MP8vzabnPkL5ceZhLv9C31wOoaicBdpV5zCsXCUH9xR7nRTpYEPHn4SHCnDJVvA
         Fd6fH4/lEXK4w+fB8ceOFqc0fRGzKCUiGXfjWTM2uffFFnavw9RvWSGC784rbWHf7Hh4
         skZb8ArJEFdY8/ADnlRE4jWwA//BoCwsFCS5RUp6H+5nCgEcNhO6m1cX5uvNDaaHXOmf
         PDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758573807; x=1759178607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8mdyqw9MjWOGNhllxvabr/uOzspow8KWf8sR0D56cCY=;
        b=snP1gC48i9b/Oh37uzZp6eXrkky9QmzcjhDlthqCRSXsIGQ2boyEZSe5QijZtMgw6i
         dt4ZE8FyUKqh1TNwTeNksiAcGYzyNrpJxBtBcAan0hA0oz7VHfiYFYYuNivKCmg+iHcM
         YrB9DdKdZ9NfemY+DGBdJcXoXu/gjnG8b9sEi8CtvXrX68HLRBqkArupPWu35l2Uzzjn
         +3okWJdgpuwtXEwS/YJh5Ho26tBa68EG/e/OvK116/TRobRk3DbnZjSKi5yasB24neg9
         ht4yLuJD8QkRSv4iMzUew8cJa+kipfHDsBWjHlei1HiLIuw+CHx6zjhKakfsSlBULDlq
         r2ug==
X-Forwarded-Encrypted: i=1; AJvYcCV+kn3nQBbAhrcKuJ9OWrPP2u1cYhPJn2J9FXB1Xb69OdeDpq7Qm6ehydElKNjWW5ITIq0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyhp0crSOxpiW+b1MglA8cvSTiLc7Ws+DmlSDKMJQQGFtFtq+0k
	Rjq70rPqlpetpVlkNXySognQZ1+I2p/4SeGI37hMBx3oQCTelCmoLYPTMlMOD7aS2Ru6vsYlhdD
	zGT3oBeoOKsudz2D64f64XzSXn1HdJo8=
X-Gm-Gg: ASbGncvDiyEG5AFRhZJKytHmr7pTJt/1RGGqYZEKYssPFhZn677U0LGFVJLWkrTWxvK
	XmTyh5oMhXjDGEnoeuV1qMNSTke9bhntuf+wBEICjEmsN9BBWzweuRrmTE1g+oPYgSuLsWdtN++
	479PFXVSiYasVgePa9PckGlycWsIBXLwkmHkd/sTEKpiuAc1Dc45N+wTUGKdjWaZS83K8uXF7P4
	lRFhAxTfwIhVt0nAhumqaBYisqmBEK/KFpYR/s=
X-Google-Smtp-Source: AGHT+IGj3u3vxBovaJkpUOiQLhRlstxy96B8VGbVKJ2qkcwDCxDFJoIh3CGOM7DTK6eraZFEAmgnBu1U+ZWVdqK3ipM=
X-Received: by 2002:a05:6512:6713:b0:57e:d7be:c01f with SMTP id
 2adb3069b0e04-58070af43ffmr901e87.14.1758573807102; Mon, 22 Sep 2025 13:43:27
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aNF1KOCs0eHL1Njb@Lord-Beerus>
In-Reply-To: <aNF1KOCs0eHL1Njb@Lord-Beerus>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 22 Sep 2025 17:43:15 -0300
X-Gm-Features: AS18NWB6vAOtYEJHU0O-pWIzCRfwsKb7fBh3jSGnR2BWR_k_vBKvJfHe8Ei0l_k
Message-ID: <CAOMZO5Ay87qRmWoCELRqCkfZtK+28bAe=0Lvwhzn3RCRKyjX=g@mail.gmail.com>
Subject: Re: [RFC] arm64: dts: freescale: imx93-var-som: Align dts adding
 missing components
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefano,

On Mon, Sep 22, 2025 at 1:11=E2=80=AFPM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:

> Before preparing the patches, I would like to ask for your advice:
> should I send one patch that performs the full DTS alignment (describing =
the
> patch as an alignemnt of the dts with the actual hardware), or would
> you prefer a patch series with one patch per peripheral (e.g. one for
> codec, one for PMIC, one for WiFi/BT, etc.)?

Sending a patch series with one patch per peripheral is preferred.
