Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7932C11D5
	for <imx@lists.linux.dev>; Mon, 12 Jan 2026 14:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768228255; cv=none; b=WldUQmUXVcTTpjdDFG1vKMpdsTR3M48eMy2qbLo1xKb7+x23NbSzZQG0lVHtqcltXmuoUmK+n4y/4NG6yMPoyXaVcTGNZXz//sLe+CQg5uZAlGSvexDPRo8/Ea/H7rpz7O/CjJAMqa9UYX55hmlFLNXNTHN6yK6+XQjKXBQy1CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768228255; c=relaxed/simple;
	bh=2OEcUKaGpeIYQRWkbVsfAA0C3huLBrW5hMqr5LEvhx8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sNu2uUkuvgCHVPjhrPyw9JAMVWz7QCkl+NgvuVHlTELBUKx1svrYPJWwgx6OzmbLS385J5jAlt+75D09fvSTb+gTXd864aldADJwRQxjQwptP0BpZdqD7O/78xF0HF1KnERSUtL8ug3nBeFG3HnyqN1nvyJ92uAimo3gFxnsHNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=meq1qna3; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="meq1qna3"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59b73193dc8so5626942e87.0
        for <imx@lists.linux.dev>; Mon, 12 Jan 2026 06:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768228253; x=1768833053; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTPyq4qlUQ/a0K+OplfgSv+5dHeytyE/LkETuVbOzE8=;
        b=meq1qna3D18A2ExorxJM2SxvRRgr7bKNtgGQi/kBQMdeeDkyM43SWNbqkrHUv/BQVS
         loNhOjYhyNEjQcM1nz5ytBsYx3zqHnF7zHTM5JfQZLMYvY6FyRkPEUGQvUCGrDjV4kIq
         /5fGeADIiFuZNG5JU0leLedonhh8TTrPIkNidz4jLWQsluJ0jdOB4UWD+b+sBg7CC4xm
         qJyu7MpfX9lTcazBRirzWbBDY2TRIb7lxWLLv/pP7NFLCiPoP2RPPmlnbVPvBYYnuaI+
         MMMoOIaqOmC0V3yHX4TjYBxw8xnTa2TY+yKQ8m9DQMt9R5xr2TuUYh1loxOEbh22WCcG
         sang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768228253; x=1768833053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hTPyq4qlUQ/a0K+OplfgSv+5dHeytyE/LkETuVbOzE8=;
        b=BImavfNj3iMq8+qWOJ5c9qdxEqRXkzdX1DSPVC+IBgibPm3DXXz/A9HOV90E3atkBg
         O/YrV0ouos6u40Uu1j2zaLWc46MwEibuD5dJjidCVlWLBv8XW7n8LWHHIeVm0L/SYbw+
         592hg6hOJ2PR+jUk7/JXQZ9zGvw8NMyuX54HOijvwSZuZETUzmaNkGCV0UTFrOHwIQfc
         dPJlPE3eW8tgWUqZl9pa0fO1g6s+VRpNOq+lpuGqcfotWFFWuY81myKpBZj4HPAECLnB
         MA5NHuG4sof6+q5mVLX1cxi7R7TzDxrH7nfkZflawAw+eolgy+kDbx6ov2Rca7cwUTNN
         oNrg==
X-Forwarded-Encrypted: i=1; AJvYcCUtGm1YzBYGfFYqu9hDdZ7bTGEkqKAiLYImbsln2uPutp7DrMVU4JJy/igYqfdbVKmXXos=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPSWj5VGNbYex/CHpN21iZofYFXDXn6dGZt04kmQwF0ecPvOZ5
	Ih+BX3xkybml4ZBQhByh6Ai3JMmatL1yPPRU99lZQ6rQ9BIlva8hsQ65jXpr+JmVRr/e/NU+IGT
	stj3Z2ltGrYNqpLklvWD1peaaPalVbzg=
X-Gm-Gg: AY/fxX4JVQzzMLcL6xGt6RA313yk6meLhGC9lhtpbvYZWkyPDI1f1UZ0h7uBRqtnCWm
	MxHfWmRoKMmFlNcNrj5+/uUXTxq/dW1+HG8O5LgNwkQuV0VPeniyY9I4ncOujMymyn3evD4Wakk
	wxhfzzEiDbhxzHp6iwWfNa+f3l9tv4g0hjK1aZgiBekQmyrCmhgirt3b8gdfpz55XBaav5t9mtQ
	NCvcfiPeqswifbe8Wm1wCDgMf2zFqgkahpLx/TZj1sX1ruANr+YSmTPgli7iOFt4+h6KA+/7xOO
	sfLTq8XqpzozZW8KtbuLtVDE79w=
X-Google-Smtp-Source: AGHT+IGhCigRJCKOH/vexrtNg3kMW3zuAFzjDSpfErMZ4r2e1dNLwyfSgC/4Mcy0Fr3nxXSWcmYmpXz0yuQkJp7TZZ0=
X-Received: by 2002:a05:6512:2304:b0:594:2dbb:723a with SMTP id
 2adb3069b0e04-59b6f036a05mr6764776e87.39.1768228252123; Mon, 12 Jan 2026
 06:30:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260112135612.465325-1-daniel.baluta@nxp.com>
In-Reply-To: <20260112135612.465325-1-daniel.baluta@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 12 Jan 2026 11:30:40 -0300
X-Gm-Features: AZwV_QgTFcA7EUgW_TvWfm8Y1HneVz72_jOkyFz9DocTNUhPwAxWA210gbistJM
Message-ID: <CAOMZO5D_YMfsPpqB4zB4iL+ENO1X31Go2CcBdK+JcmsaZ_HNNQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: imx93-11x11-frdm: Add MQS audio support
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, kernel@pengutronix.de, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, haidong.zheng@nxp.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 10:53=E2=80=AFAM Daniel Baluta <daniel.baluta@nxp.c=
om> wrote:

> +
> +       sound-mqs {
> +               compatible =3D "fsl,imx6sx-sdb-mqs",
> +                            "fsl,imx-audio-mqs";

Wouldn't it make more sense to use compatible =3D "fsl,imx-audio-mqs" inste=
ad?
