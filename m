Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE7573451
	for <imx@lists.linux.dev>; Tue, 18 Jun 2024 10:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718705573; cv=none; b=ez7iTNgRFoyN/m0PzlHrbOs2SaoGXOXVwytgyvy2n5JafI+1CWq1XVLV6IvXJa35nf39UWwaeIOpKEBD6ndnk3b2TmachHlxAYoC+Qb3tSlAAltPbFsRGD1nc5cBdVLdhka8YCKlx8BY4A/IT+vOwZgfOMGCL06IiPGwor8pvfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718705573; c=relaxed/simple;
	bh=6mJGdO91RXcGUUmpTMS5iulnchhEDhRErBL2SBn7y1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mcfV25UDwbjoBbvupX+GwqjqKwr2q+jHSLSZn8B77G8J7VvNuRSN3pbehjNw62xHtxYKqlAHUoIDsgEBiEUQsoHeF1R/cE8YRclhx6ycjs50hXA0wrWfetQEOE3C+zsHkOportH2IMde7KpvOXXgKFHzCtvVDu2aIW91WGftK7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ItKE8/DI; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ItKE8/DI"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52c8342af5eso5531923e87.3
        for <imx@lists.linux.dev>; Tue, 18 Jun 2024 03:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718705569; x=1719310369; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mJGdO91RXcGUUmpTMS5iulnchhEDhRErBL2SBn7y1Y=;
        b=ItKE8/DIBwxmuYPG6ee3ZD+Im1LzsyrFiMX1gai1ncKNpGuFr3WXqW07+LZ+M0IkbF
         +JKi9/kwraZQCWKyDciU0EGwqwIdfazGqkU07aNNEGH/ETp++IExaYZcJU4HnHvdnOvU
         5+1OaHzHgnv22m29mzpJybPRPwbIxfM8IMjjU6aHLfx5yNk8tFOko9JQhF5uYgYa5iEt
         Stg5FyY60T4xIs7KHGiBTbr/ITxjkbPoasZqgk4KPesHXirUvuyej0Ptt41c+lOGIZtB
         Omd2HGJ9ddQtbYQxEMuPJUPSpCcK1+TWjco7GM3lGLq10DOu1D0fYcrh9p936frA1YLw
         9ogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718705569; x=1719310369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6mJGdO91RXcGUUmpTMS5iulnchhEDhRErBL2SBn7y1Y=;
        b=cvXn37vVDOUVLX/oIROyETBT0fTAkLUctwWb0q3hvozQxhzbfV+QoHJdk+0xyBFOtP
         eWfgmxyi+osuI+kydkpWzlpJTtegBe/q9/J2uiiNML+XpFlvvx8XOoK0vQsDsXIoETau
         wYiFpmnTEieUUFMY+IHqjsUngClEqym9uYfrm9XMvaX0v3xwqQ/WHo50AFlqqlDt3bYn
         4uAXgWessnF71k//+/jQq2pC6bNtFW3dXFF/YvLoh1zHsRgFK5K1zQwe+fEVv4dWDF23
         +orxpLlWc/xhxcJnRUBMBDa+AM+ykawq5l0fOkSN+XDPz0ndkjB/QMsiZDJmxYrs1IAq
         DUwA==
X-Forwarded-Encrypted: i=1; AJvYcCWcz2qmxkuYW9a8F30XVUD3k1IpRC827mRUvcTK2QR8uDljfw94fLZmg9yFKGMYf52sl0gsy6IgMA98fxL2a10C8cQl
X-Gm-Message-State: AOJu0YwrZ5jJi2TPYK0WwWK6wEUUGVPa/HyYxDdrRnFzVQUyNyWBd9es
	BOfY0fmit7XKUnQArQbCVUA5cmHmcJWV0ROkY0vxyQa9vSfCQfrlBVIEgWkQriqiV91ZFu7ExP/
	Nabqw7XU0azllSrB0xJP5okHOPwpxf+Da8eC6Cw==
X-Google-Smtp-Source: AGHT+IEKxSYIL7tUGgByZhiLAFjBAQVY6s4nNE+5nGraekK5gKASUp0MAAKFzLc/2g9E9O4NH5x6/Qwg+Tbi7p1WJE4=
X-Received: by 2002:a05:6512:ad2:b0:52c:9468:c991 with SMTP id
 2adb3069b0e04-52ca6e55dfbmr8037884e87.14.1718705569563; Tue, 18 Jun 2024
 03:12:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240521-pinctrl-scmi-imx95-v1-0-9a1175d735fd@nxp.com>
 <CACRpkdbpL=HUXj0hFAo+JNki_RA9aix2sW1cg13g9=89d93PZw@mail.gmail.com> <AM6PR04MB5941328E3343E5263C87528D88C12@AM6PR04MB5941.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB5941328E3343E5263C87528D88C12@AM6PR04MB5941.eurprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Jun 2024 12:12:37 +0200
Message-ID: <CACRpkdYprmc2vm8fVHBSYD+LtJavZ1tj7uQyTeVGkSv88RYF=Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: scmi: support i.MX95 OEM extensions with
 fsl,pins property
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Aisheng Dong <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 8:30=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:

> Just checked your repo in git.kernel.org, not see the patches.
> No big deal, just wonder if they got forgotten.

I had to figure out some bureaucracy around the git branches, it should
be there now.

Yours,
Linus Walleij
