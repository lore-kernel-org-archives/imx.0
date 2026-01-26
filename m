Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4212264A3
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 15:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769442910; cv=pass; b=iWXwW8k+wOhew9ag3b4AzPXezHlhneyRIj87dP+8Wl7qFSRv7TWUdcJud2tAAoJyFBZdQBAQN69Nk54YOEF+NPBrTC5oTudWJHjOPAkJ9fwje+ye4UJayh+Pc34VBAPsY6ruzxyDlhgU6Rs71mTkAxJ/UyFGKDOkr9X1+7grXCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769442910; c=relaxed/simple;
	bh=/Hesy3WNA157TAdMBzarWweQcPLGwH1r5vKjc9cMaj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ggQ3z6tNSjWMfbtUResc6KX8fYPYlRpTXqJ3VIzO5NaYa74Ff5o618Qv9Tx36TOdo5sZnS5esLCITnQqnYBltP4yVdql6+ro3/RxELlSbYMW0Zw2VwmC6YM+GoU+KULuNhURJ319WoSRjGjUCYSTDB1mh+1jeoS8+w5rfiadXQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/QgT7H9; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/QgT7H9"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1249b9f5703so281076c88.0
        for <imx@lists.linux.dev>; Mon, 26 Jan 2026 07:55:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769442907; cv=none;
        d=google.com; s=arc-20240605;
        b=Bv7szPYKb4p3oFGiTfR77d+xLgwoDmpEowDAk2z8QDgxbxJhfNv7b4ikPsXdW0RG9b
         oo7GHkbwnB9KWe0DIAFSCt5nBOuoBF8XpD3n6M3wlUGCv4/YVmVMqHWRgJtEtvgzfjQj
         yWqFJ4Z3psgVFZwrm8eTAX01n4Ll7NUgOcrRkVaBsFsyhrAvl6hx3nCIV1fvb3yqKk8a
         9inY+wQZk8ye9dbcK3Rp/XG3hFJgb44T/3eoiO2SJyBmc9rphX57AVCDE4bjbAFN9sVv
         UKB1f0HtrsLTHdqTJKr5uWzLzZFq7ledBTG/qVXXt9IOL3Z825cxqAJfyNvFKnGOnV/g
         7rrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/Hesy3WNA157TAdMBzarWweQcPLGwH1r5vKjc9cMaj8=;
        fh=MbD9+iRIH9viOScF4CtTKmwp71OAW8G1kiwHRwM6iR8=;
        b=UKkSrFmh2q6ZpA1xl/UkEFZ3CCL9eztq0xjv3Nee7IW1wdQNPDEVYZVcDRRF7cBb4k
         rL7pbNMo11dx2pHugeL5FbUJVMAh3NFtOV7Ja37+350OCY1ggmJIpG8UJvDbZMINf19f
         dfK0M9UNTJHtkpaw4LRN62fjmYduN3mrlPPWq0crHgc8KeYtlIGScdn9IUsCbRei0Ogv
         6L/fQKvTrqYluHi6A1Od/ZrhUaUV2eMes92K8F5JGbzgoj0ybGqXWGrBjz8ul4x89urE
         CB8bxznkGxeBVbPmBLjIhF1euOFs7kjexXMoAnTDZ2Fij61ecncTb0JVEIIG2U1PEZRB
         I50Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769442907; x=1770047707; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Hesy3WNA157TAdMBzarWweQcPLGwH1r5vKjc9cMaj8=;
        b=R/QgT7H97Zxjt/gwxoOn8436J1W5wo4RkDdCKGsfi5+uj4bQ+RMTX65iDu3HxFcNpd
         km6C0tFtcHRli1Jzmf7dxoY7al6heXGHEYx/zFMRKCUa+DZGkQ3grJMMczKEqE7dHKvK
         Blg953sNnqPxvK3plrxP8nmHXVpqmmrVHtdSqRLAwT7z7zpvMnjl4dHpJimlZoeQwZYA
         5P2UchHW6OPU7AauZfpSsrZlZEpfg+nzVlatGPfp7BaDbR8I7fTrWXv8deEFrRgGw36p
         UjGy9TMcvoXrRo4LtqRIz7irF4AN5DPAnjQGRwCIDIf0egk4jqPjARx4W+dOk7+atlQ/
         yt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769442907; x=1770047707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Hesy3WNA157TAdMBzarWweQcPLGwH1r5vKjc9cMaj8=;
        b=MX+jVCAjm0OlopDlFunqzQJurOo3CthqXrI6juMr1ZrezReAuBLE0oi0diyLM9V6PG
         M9wJ0eJVNS7NauFsPLGFrfsbac71hzfef/i+Rp6GuZ9FhcnXE8p0LjPlX9C52PWwrZnm
         jXrlNM61cD0bqYq9L+EFzRetPPSN0PgAd1yGR6ZC749JjpPLzzsGoKZYI6ZnUa+3tbxb
         dUhfWU1Em9v0l2Lm1gWRp55MLJ6xAaVVI9zIhSRxu3hyko3z0Pi9EJwlmsy8C1O01T30
         y0jgS/VIqcjwHg+t/VKvQZj0yAaTwQtgxksDvrSJMQ3dBg6wnXpm2mj8A3AohW7wRDWW
         zpJw==
X-Forwarded-Encrypted: i=1; AJvYcCUwMuOtb2x0oMeK1OlPaEFBtPUfw0xD9VXKWhrmxtyYEhznFYKG6YOrrDIOYj4J6dTFT2I=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWTHyitDe811CKIL6QHjKtduVVKnK3Rc5ZnwhsfeluhvVkaIpC
	6DJ9jWnBEtFwhg1Vn76CXIRa3O7iO2Nm8urEQdS13ADWhRKHSgEScx+9Tx0ngkV/6mNwz0+Gv+u
	Nd54kYR5/R9mXJFysAtEJqVmDHjuMhaw=
X-Gm-Gg: AZuq6aLsDuaaLguI+4+mGBiZn6WEgjoE0ZZyQmcHzaSiwNjCex5H6aNPSsUBaApoo2f
	A/Rr3N+q7bnjfEWhhGRT47UyhKWLyiJ5CL2RRphoKmVpXlyHqr6ypLuSVskoEQwmr4QZXXDCGDh
	YQGnM/E7f5qfAdfaXqYSQPkbtAIv4aPXgA/4zexuNs2HAfAIGkfHuTEMzaujFPM+o1eXPUcykpS
	V07Fkq3JMy+8pZWSN4K9ra8Shgf9p8AcROmuMHdAcLf4nJLqqWlrDo6cVinImVzaUoiOCBJP6oX
	6JdvcJW5ciQyv5u3f5L/pDRR2Vf3pvXUceXXr81R5Yw0NNmlrGk5jO37Oj2lefvVrnpkmcknfU7
	Z2gWRuVT9AzUa4w==
X-Received: by 2002:a05:7022:6083:b0:119:e569:f610 with SMTP id
 a92af1059eb24-1248ebf0a49mr1954211c88.9.1769442907480; Mon, 26 Jan 2026
 07:55:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260126145537.2301-1-laurentiumihalcea111@gmail.com> <20260126145537.2301-3-laurentiumihalcea111@gmail.com>
In-Reply-To: <20260126145537.2301-3-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 26 Jan 2026 17:57:52 +0200
X-Gm-Features: AZwV_QhA7W5Q3bPcFDKVTkQAu_DrVk_1nocQQ4dhm96_V9DFsolG5j1PxG9BQFE
Message-ID: <CAEnQRZAsiciJDQTAOjwQRZqxMW7sNifRf5rGBNq_sS0s0kJKcQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: imx95-15x15-frdm: support AONMIX MQS
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Chancel Liu <chancel.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 4:57=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add support for AONMIX MQS (i.e. MQS1).
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
