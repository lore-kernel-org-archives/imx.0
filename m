Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDCA1CAA79
	for <imx@lists.linux.dev>; Tue, 13 Jan 2026 15:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768319351; cv=none; b=EwVZQKPAL7y24TXKZFXuAf2HpLzgY0+z5kPCx3PnCN9XQxLo2fQyN/1XL7LrYsn3n2XODdK1eS48/VITB/w2rkzq9QdsSmHbPwLTDa330EjcTfRK90Xf2iVfwGICfKVLbbEi9RW3vUeNLq8sEhn9ya6d+y9kOYWs84R8Y6FO2EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768319351; c=relaxed/simple;
	bh=L3oLbFvwOOJts0UzMwGyJmDUy99A1kmDLLXXtP4qNCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HpvHtnZtH108t8zl7uskk9drnDba+Enwmtedc7p4AvCz2riJzFUnN/rAS0drdDrQ2A2DOjcWgYk9hpzMztZiEnkU/3hWEgxHnCwmHuEhN+JE198k4ojfjjALXe92tRWemVRNteyN/BW2lD8luAoh18Dv4X8arTuRkyWiMMwg16M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bl96r09l; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bl96r09l"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-11f1fb91996so447765c88.1
        for <imx@lists.linux.dev>; Tue, 13 Jan 2026 07:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768319349; x=1768924149; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3oLbFvwOOJts0UzMwGyJmDUy99A1kmDLLXXtP4qNCY=;
        b=bl96r09lGsVCbHT/IvTFo7duQNDZUq0u5QcUp5rPRcr4ZT5idsqlsdxcObDe0rPk2O
         lmAz3fWy54LYO28m8KIJfe9fWgBafmymy7seZLQXrvLd9HRhvck203QNir/UqmuIqSee
         hQt5Ls0kloS+LVf2wmubDYPgwxzWTIgsKSZ2z10clZfxx7jSO6KD07v8gzPZ4vP/vpfq
         Fnj3VQTLWw6gsjImFMfferJvXinO5yZvWI6grXW+9ku/4/MZS+AW4svy/gAPn7XdjztQ
         wAuWg0Nv3B94oLgUZRycrvlQZ2D+1y4/xLUKFC6YBTjckhYVg3oLmZJDoWxDUabMPp59
         +fXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768319349; x=1768924149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L3oLbFvwOOJts0UzMwGyJmDUy99A1kmDLLXXtP4qNCY=;
        b=wzkScH6+xFnL+07a3pPLJ/ah0XSUZAMPI0KaNtFLUuEaZVhOO30YkU6OYUYQ1bFGPr
         uAtdS/63US9M2VSh8fKsoLU5PpjcwTCwAenHHu4Wu6pZTl8ereFEN+OQ8UXWymXPUTqG
         7zhz9alsSUDNIjh4oOHkn0ZPBNYCdEypHUH/ITs9szu6DpUTQPUVIErf3EJaKX7xSi5V
         TuYp1t6Lt7cDVLsPdFmoKdO5Z1k8GVA39q/0vA1W96W/5nZjU/XUdxyNzJhvi3nB3e4G
         ZhOdVC//M7UaTLQqdS0W7nnKAHi47ltJ7oxRnlCgmk9LLP99VuV6oeesvevRgqGS4IJb
         ZJMg==
X-Forwarded-Encrypted: i=1; AJvYcCW2/P6rsH/Zacu5TKvbqALcPPeiDIya8B8Kk6mzzOspxhbtJ1QGdzPVcbI+IEHC3cvq7vM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSGf/3dbDE4iD2ydtDuA83CnInkyCHRXjjZTpLCWyA9DLnULCV
	BsIJbsXBnF4joaz5LnqAoDQYd7/C0hBZZqi64V/iybyEBLNdtjA04yPiWpnUfNphJffBgyHqjN9
	OIqnzu+jhzbBH8dwbgOCs9j4BqEQ4mBM=
X-Gm-Gg: AY/fxX7yYjTtZ7vish01R2pEk/NcL5rqqVQh3wcldnsc1Y3icIrhZhtix6u2/5FFdLQ
	aFK6eTo1gw2upMB6u8vlSdRtu1InveWg7De6VXuf4VgvDRPeNAfwLoIJSXs63u6eUzPkBTRWbL3
	aVJA/a0u3XR8KRoUr3sJ3eIyyrwmeA29/E1+JlSUCzyHDuHHKoglIBFZLyojB7a2udsrPN3altq
	wHvrQw5ZOy2HVr6vrk15W2rH0inic3KWljLR3lWAqUn32jWunnQIWQjby5BIqAfwurkZGb8kQkr
	q5VGSWWAol0dF+W4/+eyDtz3gdHwJHJP688gAh5+p190gCyW8J5zAG/DFAQgrjHdkdnm+a/XHhj
	15n47aHoBWiuMUlVoJmvJ
X-Google-Smtp-Source: AGHT+IEtf3xHFMK7bh85v7wy+tj/RylyAyqCoV9aOeql1xusdXvXq6rsq1/RBjQjsVrrgZEZyOQmOhuD4FnrB8WmMNE=
X-Received: by 2002:a05:701b:2207:b0:11b:9386:a3c1 with SMTP id
 a92af1059eb24-121f8b750d4mr14170039c88.44.1768319349465; Tue, 13 Jan 2026
 07:49:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260113-v6-18-topic-clk-fracn-gppll-v3-0-45da70f43c98@pengutronix.de>
 <20260113-v6-18-topic-clk-fracn-gppll-v3-1-45da70f43c98@pengutronix.de>
In-Reply-To: <20260113-v6-18-topic-clk-fracn-gppll-v3-1-45da70f43c98@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 13 Jan 2026 17:51:38 +0200
X-Gm-Features: AZwV_QiQSE65KDDt7M1WU-fsU0Y3sGYlf63F7cu4HgA_-IsmphqZd0FRyAjQOBM
Message-ID: <CAEnQRZCUJKmH5TM9F9zMHpTtZ8K55bNL+7AtaMysyaCBru3wug@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] clk: imx: fracn-gppll: Add 332.60 MHz Support
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Primoz Fiser <primoz.fiser@norik.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 4:53=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> Some parallel panels have a pixelclk of 33.260 MHz. Add support for
> 332.60 MHz so a by 10 divider can be used to derive the exact pixelclk.
>
> Reviewed-by: Primoz Fiser <primoz.fiser@norik.com>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Acked-by: Daniel Baluta <daniel.baluta@nxp.com>
