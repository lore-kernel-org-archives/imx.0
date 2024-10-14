Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E9DE571
	for <imx@lists.linux.dev>; Mon, 14 Oct 2024 14:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728915625; cv=none; b=FQwMY4owPE2B+HZNytg7dCfEIP5ff/YNAX2QtdV8wur1yLY7QiF9vZMWx3xtzvFqnxMXJMtbQnIHYh3lSjxF1W0W0HpvaOvzIDPvmYvJoCYL2CGKKzDuQg0L8BG7fwhRizWC0BFaxFH8iDL4ssQNlkqquxXrEV+pGV85DYasaNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728915625; c=relaxed/simple;
	bh=1U2eFcy8btOrX7BWJkQL0y+3D3BkWa7uYK0HJXmC4Kc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PdGOrjUI07EEdsRETOvo2Oia7yiGDPB43whXfSDjm4KRi3yRAD2zl/Mb83PFQ/5mRPswcCx3seJ2lYVurpM/1n3GwvFdDAN0aIg1k+Ok3hfsghg0+HZK9wHChjZzsEZOfELHQWvVeTTyD7kGE3R4g/ohR88SNFUbyshg/QacDm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dbg7/wLm; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dbg7/wLm"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f0f9ee49so1391708e87.1
        for <imx@lists.linux.dev>; Mon, 14 Oct 2024 07:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728915622; x=1729520422; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1U2eFcy8btOrX7BWJkQL0y+3D3BkWa7uYK0HJXmC4Kc=;
        b=Dbg7/wLmudeGDmflwJzGrTbo/f/uAMVLEDJ0kK0SiIWxUPNzw7tTwtiBymcGtN+qpq
         IBX4Sq/f2IHu3FSfzm2GB2UutrrU9ANkc+3sQ5j3DfbMAWZgSOXI7XwVWMfs1MVTjtOp
         cN6AqIC3erG9hSk7mFfNS9ByTGP1MZ/EKtprOno6sXz9Kjr3Gg9hDDLzh5LLYuFI57bN
         tMsiXEasn9UmFkUPFX70UIJJic+ZRP7kV2WQUiBFss5d5J3DHJcpCAzOeBMVhCrHa8+g
         HYWlNIIRhBjsRbTU6ytUJ1oSUVrOvNEf9BQkBqk604ohVZAJwDt0JbDSor1Q7mnzrS3L
         0aWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728915622; x=1729520422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1U2eFcy8btOrX7BWJkQL0y+3D3BkWa7uYK0HJXmC4Kc=;
        b=HLRW2q/wDrTFPuQ2IimGxiP5wmNK5ODtRGkTGZOvBuovd6xXGYXlh2uU6/iq1/YLDt
         4F0G623PoulBojyxfwvmNe4cqgtCoKY4lrF4ppMxHkQtWp0FwmOFUjzKxJzKJ9TCpPwN
         YQ71w+Ej7H00Jg4NE+Gwl1Xb4G2grEC5N6JbwPAYwFuSomLSGPY2uSHx8zzONYhtkyEU
         o5QfWVo81l+uOoQzmLT1GlS2wXmkQn+BQTVWBLeXaArJN7VatvYj3MaO46SjqLP+Tlsn
         8DeD6rSjVScbGliHip5Ry1iCXSbwtpgTLfgi7bl4fxQPvmqbYN4iDtKxW79knpTG/qzB
         lflQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsKOkjjXQXgJrpp/rxTBQ79zIzMyMcEaejTvDc4Uoge9gNQhKGHJUqRS/g97Qsp9L99rM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxdpeEVKEuK2iJCXJkXmnctNMaYlWnfbzymLIXsyn8gx/NBr2vC
	mqGlJrvHJCN9MDrdlHENDZ6Yjg8m6A06MiE9MSXUtxzFGuRCNESXhoHmOu4MQ0OYGLck/BKWtAM
	joL1nbGJkY7DVzpbSJM83u8eqhEs=
X-Google-Smtp-Source: AGHT+IHEFNvqDXKt0pGhSKYkU7CMdg6N4XcIBaTaCc0yZ8gHXEwcN8ltk8mVyRKlKqEx2HfiESSWu0MqDfFpoe9gndQ=
X-Received: by 2002:ac2:4e16:0:b0:536:554a:24c2 with SMTP id
 2adb3069b0e04-539da3c5ee1mr6119083e87.13.1728915621449; Mon, 14 Oct 2024
 07:20:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241014-imx-clk-v1-v1-0-ee75876d3102@nxp.com> <20241014-imx-clk-v1-v1-1-ee75876d3102@nxp.com>
In-Reply-To: <20241014-imx-clk-v1-v1-1-ee75876d3102@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 14 Oct 2024 11:20:09 -0300
Message-ID: <CAOMZO5Ct1u6d8gnrSEbBW6b+sOdz3W=1oF0y21hdcUFdr0ymzg@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: imx: lpcg-scu: SW workaround for errata (e10858)
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Aisheng Dong <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 6:03=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> +/* e10858 -LPCG clock gating register synchronization errata */

Please share the link to the errata doc that contains this e10858.
