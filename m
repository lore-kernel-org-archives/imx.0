Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B0B1F239F
	for <imx@lists.linux.dev>; Fri, 27 Dec 2024 12:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735303616; cv=none; b=t6Th746fj2tOKoEgx+mj09KXi/s15+HNT8TMCjnouyquPuM9c0FK356Mk4g6GqWsKzIE+tYRgcaPrDAzBdRmxXqT9o/iBgQW1aQONkDUA1bCFIZt27iIZSA5/4ismlxLh5zqgDrpvFNUDKvZU2HmQVbXs3M6WhOGYDVNJV0ZgpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735303616; c=relaxed/simple;
	bh=2JXqeAkZqG7diPY6Q7AMWo+pkhWKh1TA679Zts4452w=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hkj86RRjxmetSiHB+QsDXFs4XKlc72F2WE7A6XMsFvHDnyFY1D8wMz1Fi/ED95juke9oshs1bc0TfWrNK7Zr5Q6ktyhHpYV/Wgnzv5cJN2LrC6Zda1Qm8Hw9H4rRDGuYImmjqSigGP3F8PE3DumPet1F89B/MYCmFc1+RA+DGoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ux7+gEGZ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ux7+gEGZ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4361f664af5so81880935e9.1
        for <imx@lists.linux.dev>; Fri, 27 Dec 2024 04:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735303613; x=1735908413; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UEnUZO9THp2QmJQH4wK4+VQx1HvXZnRH5UGZIBC6hS0=;
        b=Ux7+gEGZUgGTkmsou05BEIYOH/1lqVo1bhjnO0e4jU4U9roZHHdTaplVe+iqO8mLLc
         hLa3t84zU0A1jiQypoh+ye1nmV9SqQR6ea2KtpRBwh7I9lU4r52IU27Y/hPKjaFGahNw
         LwUWR0JzbTYrhkECkhz+Qd6sGYdQEUrSrc7UdJXVSo0HacJzSZvpxEM/QI8701Wn3+zb
         xDzpc3ymQTOXu4eec3Hkf/Wu1m0iJabxZ5MJjS2j63yCcHcGe+52X5VYcdZlC/eQTPA7
         /NOF6gakDwjWTRMVRIvkgcaJfX5QY/J3oJZ6Yhh0H/2UG/b1kDfQczrtzReH9INET3rX
         FkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735303613; x=1735908413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UEnUZO9THp2QmJQH4wK4+VQx1HvXZnRH5UGZIBC6hS0=;
        b=CFgb371At5jyYdL4cnxHpeX+aq8SCvd4FYmEwKEZwi9vwkbAsUkeYeTYFMnbVNZdIa
         Hc3Xi/+VCW4AQln1dN54jlvH1wude4vw78aDspcB3iD7nQiriQ5A5zE5JVblTKkS9Jhe
         VsiFHD1d5Xg42Acl9ft4nHLagkf81DVIPEvRm5msWb0C/Xn+OE9TpBNCzWy48MkKSZvZ
         e55w0r7Myi396plCEIWRqUnxvIKT5vgO+MbGV257dpRI3xUVmNvMdw+1MltSZIXl+BKH
         NkXjCCCBZUGsSH8R8NXwqTEOAAa/BLN1Qp4/pQWTd6cJvAW7Vo1i8BWhAgJ71Yo7NzqO
         hvGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpX4KzBaULXlgOAvmPZ3BzeOnHnxO0HsFDv89kpvCKtHUQApE0qKOUnfpNLK4S3oQrX/Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzbdv6nnlpmq8od0G93pswslIoeiR+L3YO+aEv27yougL1OQon4
	V0piwFJe3iUfPcy8OqoMaLjlvTKH+WZv+EA+0yeE0dX2zuena0YLrvibJeNyMe0=
X-Gm-Gg: ASbGnct2evbzLFkikvghr40AOsix0t5AX1O5apEUsd4kFpbhly3QVE5dOyl6klovja7
	h2RGrEl/kld2ueTsQCOSqZwbdWgC/cEs52hYDzht5YAz8WmwXRaiOz1PECZyOR3MASyNmGajSlK
	uXzd9lXaOcLxaoNGHjWvyWN5Let7VDv84/hNjbieAMiWNEUc7so2l8KDKEkoNDVQ7B/6Oj3zz0B
	5LPIE5c33uH3gmOfIdn2QgVzvpqatZrVLo9EBdUoS3bnraVJqRfUkV1
X-Google-Smtp-Source: AGHT+IGQZ8FD/ZdXOaKiLcZYnvRp9y+mIdk15+UQCdfKpIMmCj7iHw3rYG0INhv1ebbbbwyJxTknkA==
X-Received: by 2002:a05:600c:468f:b0:434:a815:2b5d with SMTP id 5b1f17b1804b1-43668b785ddmr206211385e9.24.1735303612885;
        Fri, 27 Dec 2024 04:46:52 -0800 (PST)
Received: from hackbox.lan ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b11495sm297172905e9.19.2024.12.27.04.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 04:46:52 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengfei Li <pengfei.li_1@nxp.com>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: Re: [PATCH V2] clk: imx: Apply some clks only for i.MX93
Date: Fri, 27 Dec 2024 14:46:01 +0200
Message-Id: <173530350113.4140483.13428387054202142135.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241225001443.883131-1-peng.fan@oss.nxp.com>
References: <20241225001443.883131-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 25 Dec 2024 08:14:43 +0800, Peng Fan (OSS) wrote:
> Enable the LVDS gate, MIPI DSI, PXP, FLEXIO and MU only for i.MX93,
> because i.MX91 does not support them.
> 
> Update enet clk entry format to align with others.
> 
> 

Applied, thanks!

[1/1] clk: imx: Apply some clks only for i.MX93
      commit: 48806be086360846bb308c5ee21fcab8405a3da7

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
