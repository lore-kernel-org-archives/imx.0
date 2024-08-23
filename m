Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B6A1411E9
	for <imx@lists.linux.dev>; Fri, 23 Aug 2024 08:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724400641; cv=none; b=CXLMEbwogA2pvV3rZPGdhTIIfAOaqp/Qt5ys9/3pZSVGmXFhD+i9WR3pmkWCn8mYO6UoP2I35wdnMKRLm9R9wbTTvPink8MuJF+q/ULXyid3eFEBfsIXWw++14yXZiKswOnJrqgkS56uNV7Axn84k5WLHhlra/EYK9JnlDYvNkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724400641; c=relaxed/simple;
	bh=cs2QYizPtyqt7HMTt9QPD4aL4X+QFKO9Zb9ikILmneg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c14slERVYU3Arft4qpqmi93RbEi6jvRie4aXBlhTrM/g8/3D0BnHXtpUPRx1ayc7mVm0IH0pvV2m7rQ4qSV+RO/8gfzqK5+Luj26r/v28qU2qU8YNpZ/1w1J+PFY6JfzX1Zx/sdj0xzyyfaXofQPxiTkQqf5B6efud9Dbp0MqOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YE8F5N2t; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YE8F5N2t"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5bed68129a7so2297036a12.2
        for <imx@lists.linux.dev>; Fri, 23 Aug 2024 01:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724400638; x=1725005438; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cs2QYizPtyqt7HMTt9QPD4aL4X+QFKO9Zb9ikILmneg=;
        b=YE8F5N2tW6Xx/9ILNsHPDvpspeBVWMqe1e/+oh8F1A+DtWIWevohDILii0Q22QHOR7
         Lp/9zoncuShSxGo1Zu66LYIhJbCeHSTkoNahJX7/dDRDV/EPpUP6HKon3bYb2Jqnxz/q
         amT45lFELhVFe5pmva3HSAkXw68O8AIo3IGXxtCa3qVz9JCuqiHF2tWKXJUmPNIEf+5B
         xX+6///AvF56D6CNiZLG4ud8pY/bM8fwzBbfJmM3uWSXMQWniw1G4XN2giDGWeM0rzBU
         eKBp8l8JMRnv1WazSJHvdLLhPNA6wMhjdxX+mxASlLJj95H/jwvLsfJ02/lta3U5m6IP
         +jxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724400638; x=1725005438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cs2QYizPtyqt7HMTt9QPD4aL4X+QFKO9Zb9ikILmneg=;
        b=AWSfIvZq1zx58BC9sMTVhQMhiADrOOuUPa6dEZRk/1QLXYsALKjE39rAMj1z6noQ3y
         rar3jPjnTAtpgf/7gqS7MXmeHEI6Zf9dO+6fMICu1COcQ5U1H8DaTFnVcFGQfI01Em5J
         l75XNLKwJ4nXtKwXyZhsqrbW9Kzsp9lOofH03PpwT0l6aMp02Dz3+eKAFTXlvtTYyArJ
         zhOzrm6LL2kwzPw8kOE4ohDEOM5hZSyaFb26P6H3+qOaoBbNnx8YI7nZvjWtL1RwYrL4
         VAYMzv/7LijEGx3CAfQupC+yhRAnBYjRD/Kz5W72m4qYxXWffBWpw/OFAC9QB/CLyyX+
         CAag==
X-Forwarded-Encrypted: i=1; AJvYcCXPbrPtOsLnWAvxquarQHO/yslWkMQ4Xq1NfH376c57UrNLDX3ZR62zmNgZXEJLjXQSiUI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzsAvYCEir1+T88QJ3hTx0G4nSku6ABF+EPM/Fe3vx+o6hzJZsN
	jlfWnLfMd++uBStqFRJxEK4s/B20mQ2krsx8yJrVRu+NOrdEoN3m6QS3qHHHcyktOGDH8ju8aWD
	ZtJqwLo/CgbSsxxB7YvBs79h4+oU=
X-Google-Smtp-Source: AGHT+IG3ViC3jHroGnJCgE2MvepgrkcPC/GRg0n/+FheZOu30c6Msim4Mb2TCl9/8TIYixC3D5issGRzFrLe8DsEk6U=
X-Received: by 2002:a05:6402:1e8d:b0:5be:fe84:cc4f with SMTP id
 4fb4d7f45d1cf-5c0891a16bemr662259a12.29.1724400637640; Fri, 23 Aug 2024
 01:10:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240822-imx_rproc-v3-0-6d943723945d@nxp.com> <20240822-imx_rproc-v3-1-6d943723945d@nxp.com>
In-Reply-To: <20240822-imx_rproc-v3-1-6d943723945d@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 23 Aug 2024 11:11:26 +0300
Message-ID: <CAEnQRZC7xECmHm072uENwUiGJYspBwpc4_xORcDUdRPYadgtgw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] remoteproc: imx_rproc: Allow setting of the
 mailbox transmit mode
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Iuliana Prodan <iuliana.prodan@nxp.com>, 
	Marek Vasut <marex@denx.de>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 4:40=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Current mailbox is blocking by default, but there are cases where we don'=
t
> need to wait for a response.
>
> Linux just needs to send data to the remote processor, so let's
> allow tx_block mode to be set (true/false) depending on usecase.
>
> No functional changes.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
