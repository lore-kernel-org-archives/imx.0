Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED5C2EFDBA
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 10:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761559229; cv=none; b=iaxZrkm5TUvKLBnDUWXStKdUXwEbLjYWtU+oPua95hcxJFh6MQzG7lw8kFoNhWsp9rY0xTerwThBfdj1wkk4rN9eZm+o03aga0M9tpAlWY3tbPaBoJerlmLkYxIl3D7sSiS/Mb0YTm/kumViWouKTJCI3lShDIPDOa+8osCqBRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761559229; c=relaxed/simple;
	bh=llevhbx7w2gVPSgxchYQykyfF3P6kCmvO3Z+1l6bNEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VkiAeosRfm/RvOIQLZcnJ6dB9g/SlQM+wZyjd2STL0ZSPr8y4uyuQ/AayWo/7eA83N+svZlr2L7k4Y3ABYglnOKcKWRRUYUEiwXeO05uGAwHBtpiGJlks7aNPF9Vo9w47liJ6FFR9P2QzBhB1JAEUhIsNr8zKz8V87gRHbcCgas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NdknlVUP; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdknlVUP"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b608df6d2a0so4040904a12.1
        for <imx@lists.linux.dev>; Mon, 27 Oct 2025 03:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761559227; x=1762164027; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llevhbx7w2gVPSgxchYQykyfF3P6kCmvO3Z+1l6bNEw=;
        b=NdknlVUP+Ca6GVN8e81uC7V3BsTyn1fPZOU4HnZ3t5IYR/Lkgcye0W/fkABisbr4Ff
         GKrYHoHsf3qljbNNleQY57iHZCcAq1mnQNzUN9E2udhq/XR1/t+T8WCOv3i9rT7xgLu+
         EKiFQ3AClrisoC4H6QTlQcf+P8xTP7yydu5dcd+cWgUzc094P98rijtvhIkWRqr5CWky
         ORacSna2GjFSzbiBO8g5h6EOtcnyYUExuvlzNiDinWMSUaCujy8UgrpF3SW408CWGW5+
         R0PmjNL09wkvourzJM+5pV1ZqmTKFlOsSzbxPJWCbIF/2ZR2ucO06hCCMFni6AcpXXfs
         gtLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761559227; x=1762164027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=llevhbx7w2gVPSgxchYQykyfF3P6kCmvO3Z+1l6bNEw=;
        b=jCFwKRGX6bCcvetEL0v/O9D+u2tT2IFh0tBV+pf+nQo9+oHIAJoYV94Rtd5lhOJCLw
         dNYiTr8Yo6FufLpFmG+cRsYlof55EsK9VJx3EKER27jC7qXBOg7vdLU3RLhU7Gr5tyPw
         I6IttD2aStKBSOskV3FoR1nVwS34W5TfgwEXDLR5pCmdzYWuDOvGhTW00uZpIy6M2wcq
         gX6TBGYh3sF/e7qEf2Jbu8c0zWVVJ6jHIyt5WXe4Yi3EX0aSSdNHikTLqEHbcXzQeZvU
         E95v2oRzxrOXRpIJCSdeDx5ph2ZnDxwiiTW9Ch4G8tFv/cjeWGWR6OhHouEvMO8XQAh3
         s3CA==
X-Forwarded-Encrypted: i=1; AJvYcCVn35+Bs0z8AmrCVLnemiQQjCYkjmOmLMpEXIiiZ3Wdb4ZzVtea/6TWQlrRti8cDJIchdQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4vwMVn5Xph2awslo5geBbQkPp1fU7Rk0+mv7ZMtGf4cOFrp5o
	AorYyWulER8bL17bQaw/55K10648krWvai9cZP5ojlSO8YaoJGpL53B5ZSH/9OT8Jk6W/a7AIvE
	cKWgK0Hg5lEww/180bbZMQ+xmCLG7ZDI=
X-Gm-Gg: ASbGncstfO2AzpiJk7Wmu55vPiy2znGiMyTgLOLX2fKpfSkxX487W9iL1h2cJIRUY3x
	uE3Aq17faT426bzp6knxuR8KXPLnFcWceD3clgRlJeXxo12aGYb2qJwg40vBmj3Vi+MgQLBGUqI
	EBcf0ETP2/I0Z7bFnkBe6Tc7NKeSo3pHYhOi6nPpNvH/zrrDydC/lw/eX80rr5we0yFcWjSJdiQ
	XHqmJRQHETQZ5iMCUqimapZorEZGvouaoIXKLuDZKfKjuIW0npD2e3svqDZ6C/DKhFeenMFAC14
	sHhNU7xFDXLxMPOSGnSMVGOvUyFkO2juyDg=
X-Google-Smtp-Source: AGHT+IEVKeBh2X8nn5edN2JNYH0ip6RRsXlkactmrlxMJ24ltADBqpxEPIq5x0ftvH+xeOzwVb5LwOMRmctLYx+ASlY=
X-Received: by 2002:a17:903:18d:b0:269:b2ff:5c0e with SMTP id
 d9443c01a7336-2948ba5aac4mr144470455ad.46.1761559225678; Mon, 27 Oct 2025
 03:00:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
 <20251017112025.11997-5-laurentiumihalcea111@gmail.com> <aPJWUDXmGkb8QGMz@lizhi-Precision-Tower-5810>
In-Reply-To: <aPJWUDXmGkb8QGMz@lizhi-Precision-Tower-5810>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 27 Oct 2025 12:02:50 +0200
X-Gm-Features: AWmQ_bnztc34-LVMElYU3hA5bxPnJsvEFVV1IWI00q3s-IiPzNkbThRFF6roaYA
Message-ID: <CAEnQRZBFCi9GPaAw+NdKboADSpzPKGL-1B3WNh1M4Nuxd_9rqw@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] reset: imx8mp-audiomix: Drop unneeded macros
To: Frank Li <Frank.li@nxp.com>
Cc: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 5:47=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Oct 17, 2025 at 04:20:21AM -0700, Laurentiu Mihalcea wrote:
> > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >
> > The macros defining the mask values for the EARC, EARC PHY resets,
> > and the DSP RUN_STALL signal can be dropped as they are not and will
> > not be used anywhere else except to set the value of the "mask" field
> > from "struct imx8mp_reset_map". In this particular case, based on the
> > name of the "mask" field, you can already deduce what these values are
> > for, which is why defining macros for them doesn't offer any new
> > information, nor does it help with the code readability.
> >
> > Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> > ---
>
> Register define still prefer use macro.
>
> So far const string, hexvalue prefer use value if only use once.

This is simple enough that we can use the BIT() macro directly to express
the masks.

As you said you can use the const value (including BIT()) when the value is=
 used
only once as it is this case.

So I think this patch is fine:

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
