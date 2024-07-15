Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E73720323
	for <imx@lists.linux.dev>; Mon, 15 Jul 2024 17:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721063805; cv=none; b=r266Qb0w3ifaRyJDZft20RXQ4YgObeXEcG5dLqYJlZyqevQQ6s02jeTJGpXW8HMD4IJjgjsGtP7bm2nXWD99eTcSbSQaMuoLqm1JwYMfGFM0OUxaldtlQ5KEKaFRc4IbslqkklOyJbHfoqVilIootgcNraf4E9t10eRhWpZMO/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721063805; c=relaxed/simple;
	bh=VrwhL/WWFEwVAdFgcTAL6RMVGDd3xEeZ6NaVc5vbYOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pyhcHjjiSF4M4YiwdHxVpD4C8twZau677pa5YGxfAhCMk50KHX14HXz77hFqYH4iZwf1nwONqIweZsenynr4RwdydUT8B6Pd0Hq3fBAm+4As1i2Z4icHePT3W+WG7TW02B8sADk1wcb5vKp0gu5oZYpR1xMCokvl09uDTDGqQmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDWOEIwX; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDWOEIwX"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ee9246ab1fso6025261fa.1
        for <imx@lists.linux.dev>; Mon, 15 Jul 2024 10:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721063802; x=1721668602; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrwhL/WWFEwVAdFgcTAL6RMVGDd3xEeZ6NaVc5vbYOo=;
        b=cDWOEIwXgrfT7colTCtufs37Uh6UhF6ayOsS8dr7ztGlGlOPWBw5yWpre5zN6C/UHj
         ly3Y+UKf2PJsA1aIuyj+t+bs+Ax4Iq9IURWVnU+9PHVkMSuFycgczKD+Px/q6L8ZS08s
         L+tmxMTGLnZWnw4NrZgeIsjRMVI5LRgBa3d7YWNk5vaf00a/N0OFLQjLXuCtOMXAW/Xl
         UmMVS72uMyXmraznbsUjNisshDweJ2CVIyNlIDVuY0MVUOTkhCIrih4EydBnbzx6mWgT
         7WKk0EvnN/mgUlc74e6uptj2+WS/0H8FC7ZSpKM211voo7kxcrfWoKFJvaEIhG2E+Ten
         F1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721063802; x=1721668602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VrwhL/WWFEwVAdFgcTAL6RMVGDd3xEeZ6NaVc5vbYOo=;
        b=WBnxQo0fHwc/ThaMfrCtnmuN4rz8B0kkcLkc7NQZEJFUEeuFZWF9fFPf78aOWrwPdz
         FPCbRrGD1sVSQjsJA8V+69e96lWGrKLKpIyAJDK3mB5joWe8fLN2k0UE2abM/Xpp0YcI
         SfX/xKc84AHwUXZfu8thH6A2LoWmGuVxb/EjC+qqXA57t2U/DrsAl8HzIHoRaeS8xlvR
         w8gGudbvdOKrqxLpjBZLvxIY0bprAx5Z13OIs7vhhosrnWni3fqLdwLK9sPWqr4g0PZA
         bQY2MVH3d47Y0bqf22cCXYALdZ8LG5EPf0axEney995/NAR8dNBYgl9H8le0v9ksXD48
         ThCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSM0sz1oCpUBxVBvD0GHlK4S5+qHp0n9hQyI/83E94LYOeWOB478UKmjfymjWMgZeV+xv2BoCP0ruW8zqiFVXBs9kD
X-Gm-Message-State: AOJu0Yz81mpSzkDELnGBoyts6iBK+7Vwpludxgy2TknRiylPJpJJ1U+D
	R9H1kxmAi4MkmrN1qR9/pWKSCpNfl3SR1Sf09/H4+PaNTH04egdcrYilz5VNaAHh1t3VYzUcvF/
	2faO5uWPnSwB8CAMVqIuN4MuiL5U=
X-Google-Smtp-Source: AGHT+IGqj/MjcC9SL66CDGBtMbvhUOOXfhuipJ0QE20rTpuMabTz5orc9ZQXo3vczn3r1jLbybvKn8QCBgh2RRHhdSc=
X-Received: by 2002:a05:651c:1a08:b0:2ee:4a99:6a3a with SMTP id
 38308e7fff4ca-2eef2d6646fmr2979871fa.2.1721063801883; Mon, 15 Jul 2024
 10:16:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240715170717.2490688-1-Frank.Li@nxp.com>
In-Reply-To: <20240715170717.2490688-1-Frank.Li@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 15 Jul 2024 14:16:30 -0300
Message-ID: <CAOMZO5AqX25zduLXfXq6zU4SLRC_zs6ZU_D7ouA70iCdp-bt_g@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] watchdog: imx7ulp_wdt: move post_rcs_wait into
 struct imx_wdt_hw_feature
To: Frank Li <Frank.Li@nxp.com>
Cc: linux@roeck-us.net, alice.guo@nxp.com, imx@lists.linux.dev, 
	kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	s.hauer@pengutronix.de, shawnguo@kernel.org, wim@linux-watchdog.org, 
	ye.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank,

On Mon, Jul 15, 2024 at 2:07=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> Move post_rcs_wait into struct imx_wdt_hw_feature to simplify code logic
> for different compatible strings
>
> i.MX93 and i.MX8ULP watchdog do not need to wait 2.5 clocks after RCS is
> done. Set post_rcs_wait to false explicitly to maintain code consistency.
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> Reviewed-by: Ye Li <ye.li@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

It looks better now, thanks:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
