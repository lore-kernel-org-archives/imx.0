Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704F9299AB3
	for <imx@lists.linux.dev>; Wed,  3 Dec 2025 09:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764755596; cv=none; b=KudJRm+4d2zya/ORwP4z7umtjzNC7q0nXxpP+2v7r1ooQTW71qwh8fQer6ReGI+iFzpJT19/vE3xaoG+7rClAB8IDS0gzPGXV5yiguXiK8RWxuGXKtcmYmVDkXvmdR7T8AXqiCbndI45RZwi/nYXNy/PDhYeTKajd60l9/iyE48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764755596; c=relaxed/simple;
	bh=0MIEaIEz+Uu4LM0hJtlrbSaF1/Us3rYdZCWuXdM8wDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PeCYmAKim3SJp6qYh71mnNd0DJK8NoMkEis6YuGv14lDWuzxXNoF/HtYkYMd+R3emh7MyZ+3bbOZgcQQm+bky+cR/Slg6ePgbL1IpQkCCBlJYBRGmRFrx5Xqg7cfPTwdSk/d5oAdJDp2S7EGxcYgvqxl9BZCpO0FFPxSYYob1EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YO2HlfyQ; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YO2HlfyQ"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so5807812b3a.3
        for <imx@lists.linux.dev>; Wed, 03 Dec 2025 01:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764755595; x=1765360395; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0MIEaIEz+Uu4LM0hJtlrbSaF1/Us3rYdZCWuXdM8wDU=;
        b=YO2HlfyQHEmDW/pzDj4AYXXFNJt5KMXWINsE7JUrRe1s8/3p4UZsYvAkNMpp1pjyOZ
         shNry22e9pBCC2at/MF5k4Z5xHbyyn4seMNLjvILmC+CsJ5azvoBBYu02XMTsdW7fnhH
         y9mK4U87BN3ohIvOgnW9TXJRyiIn7MU7TBeVaNgUoZYacQZ2UUP/1yJBBhzPcRGivtmX
         apDMcOpnDv8coVs9YVG8Sr9LrpLeSDUrcv9584WDwYNeNy6vVr9AW0FAhcfk13MZG01i
         3Ot06KStwQFQtsrVT2ZKeoPSdvFcIQjFzlyrlehjFCg+RMYgygzJW+jngxRJEZ85cuON
         CnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764755595; x=1765360395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0MIEaIEz+Uu4LM0hJtlrbSaF1/Us3rYdZCWuXdM8wDU=;
        b=BHu1z9WElfZ4bcZ9mvwPqX0MG2Df9mEbxFxhHa7ea6MAgMwMRGsAIw0Df6o5V0PdU3
         YPomWNlutyw9c2lir1vjWYbsYkb1kdcC2ry1x2iOQejjZTcwOYpW3HWEBz/i9UiIlvKB
         aamzmW8DbV8asp1LUsi8g9aTN2krpkFIQkhc3VlvxnKXviOpBoua45Q26YYfzyNLCTVC
         IXMdkIiZ+Zm5VCOQ+4zGZ/oyccfW+k5FAM58rOUG24B/82GF2NBD7ySwvAUW2tq1+GTP
         QZTOl1PPWqY5F6lQDHLiL84y11P7tw7P4cWuwEF56IcUGCLq1JYQ6Zh87j4j58Qkrouv
         ghaw==
X-Forwarded-Encrypted: i=1; AJvYcCUgk0CFNOUs0XlVReGuRHNeWZaMheg0O2QFilPCe1d7ZmaJ/GRsWJqquhqCUdD46FajxS0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3CVSpVT+s5wcOFQ7wC7KQCzQ6uNNXb/di4Kr0OhfNwXmKPOh9
	vmg8LYh6rYw1O4SvROiuGSURFqIZ7dgLvb5pDeCMqQkH5YgKNRH+6Y99uxsqsAU7ASrCi5f9a31
	DG9X4FUIR0eTlXWr/5nPvRujo3qSchms=
X-Gm-Gg: ASbGncuvMfcYbZpg+JhI2qMvpJCLXuo0WiTUruiHoPOT+VqzCdVmATNvVFp3GQBrWIg
	25iqw80FoGaxjp5rrfW/TWVHpZ+hpA8rmlw2lg0eQhNc4s3N33HsRQxCm6HYWvyeOD+YcqM2/rW
	0N987L9r2GITkAIOOwGlkcAzcG7uQIdxe9kyTaIK/D6ynaAV1Oq6dYuGC71FD2ChP3WqvqvU0kw
	0zWLigjjXW4jZGP0/EjnwzPjYNMruPvmjh1F5gI9/1l2yHv1oK3PcnHetSKrfvy/2ca6yNyRY1b
	t5qf32jRkMzyWWfttbblsyZh6H4qN8LM9OPcmZrPGuQVXWu8ja+Rp0jZ06J6wc8ZUpnl6O6oGbU
	kgwZGJ8CFsg==
X-Google-Smtp-Source: AGHT+IHHiE5h9vFxn3JWLglIm1nyTMKgPs1nJsrmvzcPj24vwltjLLoR5BR4ubExcXnNuPJHINfYUI8wqXTVIRIaQbw=
X-Received: by 2002:a05:7022:3893:b0:11c:fe15:f66d with SMTP id
 a92af1059eb24-11df0c5e372mr1051422c88.17.1764755594695; Wed, 03 Dec 2025
 01:53:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251203070605.1868821-1-chancel.liu@nxp.com> <20251203070605.1868821-3-chancel.liu@nxp.com>
In-Reply-To: <20251203070605.1868821-3-chancel.liu@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 3 Dec 2025 11:55:47 +0200
X-Gm-Features: AWmQ_bl-2uOJJKigyYxADeo7ivsphIlHSLcBD3op8Es5RJBv4uA5RHkTpe-gdho
Message-ID: <CAEnQRZDx6kBwMYzXRH7zEzJQ58We+o6cfEh-XYcnL6tL4K+gFQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: imx91-11x11-evk: Add bt-sco sound card support
To: Chancel Liu <chancel.liu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 9:07=E2=80=AFAM Chancel Liu <chancel.liu@nxp.com> wr=
ote:
>
> Add bt-sco sound card, which is used by BT HFP case.
> It supports wb profile as default.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
