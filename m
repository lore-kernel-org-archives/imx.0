Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7334736A031
	for <imx@lists.linux.dev>; Tue, 11 Nov 2025 15:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762875995; cv=none; b=WpH+Qfuhwir9J/oHI6tsRBFP85TLk4Mp2boK9YWyGG75x5DGgr53GfF5Pkhb8MBnN92+uhjgbzhijVXTjRadTaVgBqCmMRFhboq6ZFoKgq4USfto0CKktFENySunTHOMJtR12Go2N7wz6LcbisvX8KXcGT0pQsqQnb/KD+Y7pQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762875995; c=relaxed/simple;
	bh=ERnZBlwh830mwLoldZOqqvJ8QgCiVP3NFpUKwuH37cA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=J2RAU7M6GtVX3H9HKwsIdy/uZMlaLXb5fqcipMEUEjIAbvQeHoXYVpkebwuH6RB4LS85Pu8fMP9QPwLVsKDzof2rTA4EVZvsjjgfM+yhAJtV+yPUFFJaSAi7UTsnOriKYJpOPyOM9MGdUCpHDftweoW3O/yErGt7TqbKvD2T+Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ANmffAux; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ANmffAux"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4710022571cso41141135e9.3
        for <imx@lists.linux.dev>; Tue, 11 Nov 2025 07:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762875991; x=1763480791; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HMARtZJuraEYMooYga7m65rMsGPE/c/b4abR0gmXnI=;
        b=ANmffAuxyOeG/3CAuns9LzYMIYB3IeIF9D3S8K/i/OeoyyW0wc4zEiWi6rFksrImfT
         BUljtSaGAKbYSDkXPMJTCwe1vTGBmZk27zpfr8YXM0LO48aUx5f2uqglHcQVihJBjaW8
         l6NLwWSLxHIaPgJK+p81IBDq7oopGqZBIWFrpxVcyMoWiO4TDfmgLlrgbCGpz9aY6sVq
         DkrlE6NQORpjHXVUMUYTldcQaD9w/RtiyLK8DjiTsfoDYPrHqVYyPD4SoQt7xl6hV3V2
         SgdOckBUvucNgl2bd/xigrn2DeMs2i/J69WxGcDwmUwTte6NRUABpMD8QvSDaj5WeFoS
         TsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762875991; x=1763480791;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1HMARtZJuraEYMooYga7m65rMsGPE/c/b4abR0gmXnI=;
        b=Ob4UY+Y0GRjiQJfYszRJAmg7n0zRGAvJwzXe9oZO+jfucg5hr5/ZMzsvddB+TjtlPV
         MNbpBHOAPSFnaKhUkfAVe3XzaQqWBVx6eIsqV9pgzrXe33wlelWk66zdcyGYeFt1Ccnl
         qrIu1AvMHKx7l1k6HiUW57APo0l/kl9+qv4aLSp2SqAlLHXL45qJZ1owCgFRNyMQe8cR
         4j0rzb6cpPKnLmtgnl0dhiCw39QDXJxannJCVGWhJh2kPUpue0dQkwRUFG02x1kWM6j/
         hOlYNpxjrBqpHebr6iBjzxthpYtMoU6ArigEdAlZ1wyaX2jb5QM/YYRJowSILFbKPNlH
         Fhcg==
X-Forwarded-Encrypted: i=1; AJvYcCVARrM80fZ2rydqXajhKAEQO0YrZZaj++wMKsA3TT5vrVwmF9h5xlBdvcTgMxmuUjsECa0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yylijcbcv1r29KusLe6dXEJBK4BIJhqQX55lZBXCIAn62T1nHnq
	tJOSgcNMHOJZs0B9ci9736A2VbkpZMz7L8DOHFbTkG3FNGKGL/1yeE6L7vAupvD/SJc=
X-Gm-Gg: ASbGnctICXUY+a5TgM3pQFNVT8btUH9JrbiYSAqMPDqvLatV7V7mhdF4emvaRO/0STC
	mxte9LMAYaSzU9VH5Pqv04xEt3AnDO2wYMZBvB6QCBKwo5enU9e8/4d++dSvN3uLFGpth4J/dkM
	wWQJI088oXMRstMp4mYXLZpO0JM86DMZupFsyw+BKwihFyF6LADux6Nr5ioJ/x7jfBn5sPo0/oM
	H5tUyDBASilS6INH38dXqPFGX2saAHjWb2RUpXvB+zNj5joAa8gBRrBXuMOkMTeiM1eSTmku4Ig
	zHymntvi7RmQ70v3BvXGySO52zgzhesQQZLFx13sHuXIvJbRZBNGoLC6bfgLV4hVDnbBGppnCz2
	u7wdl1tVrCbKxBT83LJQVe3LE4TRvtBAeSp6y/ontlni66WVss9IvznGJsXWUjuZVeTmx+eA1h5
	BAwZ+4QASj
X-Google-Smtp-Source: AGHT+IG/mjf20bwbB9ulOVh4z563amE05UyfIyNIY5aYHGSZyB1LNnu3YZ77PJ1u1Qd3j2JGeLOsNg==
X-Received: by 2002:a05:600c:a41:b0:477:6374:6347 with SMTP id 5b1f17b1804b1-47773271aa5mr102937745e9.22.1762875991319;
        Tue, 11 Nov 2025 07:46:31 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cdc33bdsm377541625e9.1.2025.11.11.07.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 07:46:30 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, 
 linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20251024-auxiliary-v2-1-a353dc9e6b1a@nxp.com>
References: <20251024-auxiliary-v2-1-a353dc9e6b1a@nxp.com>
Subject: Re: [PATCH v2] clk: imx: imx8mp-audiomix: use
 devm_auxiliary_device_create() to simple code
Message-Id: <176287598917.23558.10560877169801867963.b4-ty@linaro.org>
Date: Tue, 11 Nov 2025 17:46:29 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8


On Fri, 24 Oct 2025 09:45:51 +0800, Peng Fan wrote:
> Use helper function devm_auxiliary_device_create() to remove some
> boilerplate code.
> 
> 

Applied, thanks!

[1/1] clk: imx: imx8mp-audiomix: use devm_auxiliary_device_create() to simple code
      commit: 9d97a2fe48ae77976baff441edd5b30ea4e179c0

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

