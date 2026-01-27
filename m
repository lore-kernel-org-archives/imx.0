Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B3323B61E
	for <imx@lists.linux.dev>; Tue, 27 Jan 2026 07:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769498582; cv=pass; b=QbrMdREzw2k7V6iu9RHIQrnT2ZK6joXGc3BgwSZm+JXwNUYe37GVNvsHJuXwvkV5eVl9fnFrVkeNCSlT8NdInuJTaZpxFKMQnZk38Q/2bERsGWZCZ97zcSquJI5lhZ/Dbf+bnpDwOa+fexIS7VtI9iIRKoMMN5nTq8Eov30Qe4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769498582; c=relaxed/simple;
	bh=8nZkdslqCA+f/H665Ckh/urjA7uqIfjns3j5MmGELb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hjqYTSkkhvE/Oio2lX/XOtcOP9WruNce+qPyqLuR3Lm0pnNWWUiYa92ULV3p2IvpQMPhbNrpvdPLwwwPiEe7YzkV8ZQIzPTMoSVuRIPD08hB7dqMpn+Mw07VIYWby3AiRdey3sXhgFy4FuJo/tA80A5DLbiIhaxLbzh5dQ2aOcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UarORzIp; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UarORzIp"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1233c155a42so7516308c88.1
        for <imx@lists.linux.dev>; Mon, 26 Jan 2026 23:23:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769498581; cv=none;
        d=google.com; s=arc-20240605;
        b=CK29WHaQe7qjVLyhq7P0NVhZ6m86+t1Wlf7VVaPBI0aAa4CzEKnZmCaHda6gfUwMjG
         oSv0TVFjOLTpzLgKTXny3dSwSgt4cfr4lNtPZJK6SBF+WK0YQQBPjPpmu7mz6jtHJKHE
         BwEmZiOJJcuuSteLdE55G4CGvILXhbfdCTwET8gtMP/xQshsD5aHjnlnj8Wh9yTpTz3N
         LBD0XBsV+ppUXqPOyPz9YQ994576GUrlcC3i5JxlfkQnR3o2gU3AqrlGQNviBg2KzlqN
         1RlXd/5GmV7nC7sbUeobyQ9vVp+ME1p55TBnI0iHJSTJ+WXsRCJ+z9Crem+DX1bkNwP0
         nyhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8nZkdslqCA+f/H665Ckh/urjA7uqIfjns3j5MmGELb4=;
        fh=49PNptSzojwHycyq6YVO4jfChJZO4WJ8ucMzHbahH3o=;
        b=bVU4CoI7vFd3wGlWmWEixHgRcgV23+ChfhF4I24XPZ+hm9LszXXKd/pfeAptk787vu
         JsFVrg9UHFbQEd8EHjVGlJ/QesJ1kkOgDoNtPA7Wf7+kTCgBvm6hcdDBB2Y+TrmpuMo2
         dahzfSiJ0al9Zywox14K9lGEjYV5Hc7byCTgdqxvXvouxvAhcO1U1QvgbqugW7ZGKqH7
         9cQOqEPnu0Bijk6lMMtAFsJUKmvdFD7vyJOJ2TFSkhJg3uLPVHFHjVA13wtyeIm9GQIl
         4/kK1c+99TK6OPNfCQPHh3nGsFN3FIb+yTq+qq42OCOKFPMmyIXXX9BwmRrel/+y+cZi
         jxdQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769498581; x=1770103381; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nZkdslqCA+f/H665Ckh/urjA7uqIfjns3j5MmGELb4=;
        b=UarORzIpwuZEJpdS1jBzh1K8h72W0kBLPJGzf4+FdYKpychXjDkxBGGXcu+ot4MNiy
         /lNxNLtBYeibbIYVTKr5gEkGjREkvPMeCCp6nrjVKVBbNR7Ps9qYVXkwC7u0CtWI0r86
         7Zv5m10ECEMNbjtdCWaSbE+8TqVJs0uNao/YSYqI0Pxoe/IuGDv2k6kK7Lhe4krhXUrT
         5i/Lp/nxfeh6zqCO34AhKu3GAnO3wVwAMuhimgA3cPoELfK23pEhF3oPbIu9y74NUUiP
         UgbZxvY3mIgYB6yXxz4Oaq7keoHX3hkj/gGxs30Xx9MY5vE9Sfudbwr2a6itg1kGeJTP
         B0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769498581; x=1770103381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8nZkdslqCA+f/H665Ckh/urjA7uqIfjns3j5MmGELb4=;
        b=sHWdhtzBdjZbPc9C1/XTWaH07mLuN6Y2pIhP1RsHnlKBro1mihjvaiYyEBBxlNp6oc
         gU0lupRUrjjkso1Qb7Lg+AoLWIMDynRl87jd7YlF/a2Bjoqp1vOOkzSSSuFf+u6TFkOa
         gWymwiTyehoLZHQ+9mFX8ufyNOOEqYwEHtAdAracUJY2pxGEoffj2OkG2otqGLVKdUZy
         yebbP81vRea4/BsLOO0zuGkgZ76yAyqC4lEtiEqXjRh0Xoj6cdZ7W+iAZ14qeixe4ugL
         FPWcHTz3yC7K1AgB3QvpyjtWwAD69SN1ONQOvJnP8UkhR25xEIj4YJQywh95ph+va6wB
         S35w==
X-Forwarded-Encrypted: i=1; AJvYcCUdK2OROQZ2eIfcv3E7or9yMziRuuk7janMWKrIkyeZEVZATUJQgVGs1ALDXNGDcCjSKtE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx34iZSzE5eAxqSp3b4KocnjvX4lPbN1eIiwHOupOwAzZtFyGl7
	ucUQollMXUgIGkmRcFk7ts1JRPIOzcSJ3/rrV9jRtzD8K5YTKn9jgeRkup+Ok+0TUv/dxIDsmHi
	G7Bjs2ndiLNDNj6whRpr3xDKmlGDT+vM=
X-Gm-Gg: AZuq6aL/iwfOnPEHkYzXk0Zi9zYI2nlpp2Xt/cH95mt3nsTFL/PgOuoAUYw0ym0tbPL
	Dsu4JQAjmnBXHFMal5f7oBV6dx1tGbvS67nza1S7yx1x3SCU8ZtYA1l9OTOL7BndLWnPHNLcc7T
	52mBt9GvJan87XO3OOuj4evWInD7X9urWdnWdvNyoIgj4VSZqj8rygpDmnycc+++6TK95qQoNhP
	umqiEgRH7cqG4xhBQKKBAWP3CaJqFJVfvJH2BdRxQSnRTuCmKwf48v4jGIBJhfZYhymFhosDzVy
	V9z7GEtakUFrhRIv6OevHTm+ko0JdPJpwmZYMlYGyzaYooiu/71tMyD5K5MYUC1SiDQX5mdoVoW
	qKSBi2rJatdwa+Q==
X-Received: by 2002:a05:7022:321:b0:119:fb9c:4ebb with SMTP id
 a92af1059eb24-124a00b1ba6mr483038c88.30.1769498580625; Mon, 26 Jan 2026
 23:23:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260126162203.708-1-laurentiumihalcea111@gmail.com> <20260126162203.708-3-laurentiumihalcea111@gmail.com>
In-Reply-To: <20260126162203.708-3-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 27 Jan 2026 09:25:44 +0200
X-Gm-Features: AZwV_QiWy4qbwZhsK09ISU2gBuNHOmG0-KHSaZiM6EoVfrKve54Js6OaQrgeXNQ
Message-ID: <CAEnQRZAWxxYJF-Bn0=Hnn1uPys0xgbcG6JDPFFo39Y+szEv1eQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] reset: imx8mp-audiomix: Switch to using regmap API
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 6:23=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Switch to using the regmap API to allow performing register operations
> under the same lock. This is needed for cases such as i.MX8ULP's SIM LPAV
> where clock gating, reset control and MUX-ing is performed via the same
> register (i.e. SYSCTRL0) and different subsystem APIs.
>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
