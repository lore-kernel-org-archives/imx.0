Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793284982;
	b=Sx71uTYkCPHajxxp6Pd1Z5Qmn+pL8HgFocbyAVp5BazY3HJpPcw8J1RQpf0U8gsyxCrS
	 zN9E8HdSHllh+CqgrQx/OpZN5J5lw7AKMXBw0EU0ge78fO3JlPcougj5nI7xVSvex1NUi
	 iM0rXJY15Bn5HEDKEzAkGFD7+ItuGboKGbqcVdwx5s8uqmCfhT0NcpvO7mu8p/97U7fm8
	 HYOptJKuQYjnPMm6324ta4UWYQ2Ilt9TZyGxr6VwXw2IZL3kujtKKUxs+sKfWGjRAgfI7
	 VLaZv1o4qfX6/uy2DW6MC2owmDYzPPJSC2hrNG2uYnQ55EtIXdcaBf8PWy+GI05Z+OQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284982;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=b0GNJbbv02z1poibxXcHAUWs3HQDdbjz3OuoC327GVY=;
	b=JoFCi4CZXSE2JeAMSBFn9uOr8pTgb9LGxL4rbFlvIIKHFZip/3vtDTIuo1fjjGX48gYt
	 Zej91XA4ieuP2BTpWysRvWakcJd1b0yCDUaXXsZFaOvlqSvgsEuHGxY1pFYLD5sTs9D1f
	 +CmQ8R1ZmDprWv14gJEuVlsDdT8sgzdko9bwVTsH9D/0+xQI+kiY3w7sXiomrE9zGlbh0
	 4yuk8QImOROTSJAqbdjhHmEjFmMkZENufITH1x4r/COBknsa+6cxjOAfamHs0mJ0O9tkS
	 DyKF/JeNno9A5ddiSRTJG0pafImQQbShI56fDGPnt1VJ8uKtNaawT1LgFyYDCse2xGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pHCodHqM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C50606A320
	for <imx@lists.linux.dev>; Thu, 29 Oct 2026 14:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0C50606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pHCodHqM
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1a86c0316so3316886a12.0
        for <imx@lists.linux.dev>; Thu, 29 Oct 2026 07:43:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793284980; cv=none;
        d=google.com; s=arc-20260327;
        b=ggrcO+gq7d2LjNi7s5NTd1pGNehFnAFLcIxipKia0m63cL+9Fgs8cnhIKZKJ80MzTe
         r+OKWxlMF6WeDOamMsMfuLlosm+rRWJOY5YKjz1jJP2MJQFIaH3eQesKsMHN2NZO/1Sg
         fMgfrgCMjj0CHsp7Rq4dr/bNlFVCG8pgXqaZRbV2spAAAiMBni32QGElAs16AULKKKQZ
         JHD8/ZhB7tehT1VWPYjf7k8Ct09h8g7zPrYE/vzjuFnj2ZT5W7mPB6uayFcdsI9t7yRm
         YvTt6YpAi1w8hAWwsVnooBJHbvmtTLsDrIOa8rRPmV9h8+cSpZwKKqPKTu5ERmNiJ+DH
         qC+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b0GNJbbv02z1poibxXcHAUWs3HQDdbjz3OuoC327GVY=;
        fh=Cm3tFETWG9+W+kkHcuFOY2YWSVnYbQW3NZmnrHk7HjQ=;
        b=qITKXK2U/PTlitnA49f3h2Pjk6cA2HJYUAT8BuYXz/u4PX25XnTn7jXksDZHE1zfv3
         y22hot2cZimlUIHARf/lFWGZv26qbE9pq9g3rB6UNjy6RPpP+yiRpM/30pZf/hVwG2YE
         /26/712hdRMgy7iiG7J/A3LUWiuWA0MipSjb/8gplFDO00PjPRuiewyssnVCyObwQFa4
         subqCq+MRbIG4Cmb/KxVGs5GVSqqW3e30pnLbyLz4MlvIY/GQC2rRWp1nBu405oAziww
         bD6pJUl/fYnxeVdidKWz3+e7MgT2UudHa0ditJ91VfwL9Q6v4y4RIZJGxjyX8FY8ckgw
         k0sQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793284980; x=1793889780; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b0GNJbbv02z1poibxXcHAUWs3HQDdbjz3OuoC327GVY=;
        b=pHCodHqMyQ5N0O/PftNuvIPbcyVpM7jGFZGgA+cJ73xjdODVGDNjv4MYPc2ec0cp1r
         l7SnN3ZxwCKRDZWLb8v5+NU92zK7EoGW1p5xaLVcvl0hb5M8eygqXbBMZ5KPH12GQFG8
         rRITSnkyYNH12p0gk8nmuR6H52i26rjzB9IDXHAeBlyP9JyD1Xzb1jFydQS/ipgGvA/T
         vwT7Hx0AKV5zz3DJQhka8DeHJcH9sNlonkqup/BM39lxjontYIr+FQ1iPXe/61PzPUU5
         NWu5YXdGA5SLzMY+MJiqoBuS6CjWLzW6xX8Hvr1Meqel6jzzjdtLVJs8aRMie3X7CxM5
         Q+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284980; x=1793889780;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b0GNJbbv02z1poibxXcHAUWs3HQDdbjz3OuoC327GVY=;
        b=D/TCTl1WkyAfZ83MQeAmb7oq/07SIutSKC/uLv30h0m7yP2TDVRM6jmkhikN4X5ije
         9SCsolBstMcTPcO2ivRg7x1pApMJwrBmWZKLueTvhXskWtG0Mn4u2NVH02DBf3jr/FS/
         XEhIhkFJbzfPGwNpY3TVGAZRFEulvTDAmJ3G29EMBGyHLE4V65lkzxN6sv5X2gk2X2PW
         pNczD2bDd8J4YJy+8ubB7x1PSiyJJumUQN4afSCp3Qxfwk5OsLXcgUXopEV/IeOBnw/R
         oJHrT2NT8Ph55/eEcn6c7snGCPPY3zM0G6XBlIj2WH9fFIOeWPb21992z+eFfWFZ5fw+
         Nmbw==
X-Forwarded-Encrypted: i=1; AKwUvBxiokK9PYDHY8T8ZHzWME0886rmNgJq31ejhVfW0iqiYSfY3+gvW/KZojqc2T0qHK030Og=@lists.linux.dev
X-Gm-Message-State: AFq9FYIdOa2QpHcT2p8lOkz8lxVw/QE49bTW9xGgJIgMPSqQ0GmGI70/
	y/GIEr5/+PxpvoDRhcXo/KtHQf02OzOfhrellZ6HSjNWu3hIHtKhhRMCtB62g7FA7twqbZpHb/9
	WBzTLweJgBBBADLnsFviZqY646FSeqCM=
X-Gm-Gg: AYBFou1z8vaH+27VVo0dXLRqTKmkTOY97FSkTHYiBzzNmbOxo+6PLH5ZznPdQ/W5Njx
	US365zElDUUfn2FavtxLh2SAXT9Fpt3GWOUF5cgI86bIOqwuMFbzNs/UaznpPwUq9lN3IhUOoU8
	nIj8kv89BtRXizVTLK8r2H25G3Dmm+FKsfuzjuMna+3jORWOBOWX//35ZroHcnrSx0DiRndGkfM
	zFCpQqG9Ze9kqcoWZ7hGhAUmJSRq1gNAvyg6oRlfzV61bRXAEP1fcA0L1OllcpMoZjCXtpbNn/B
	pa8A+nwmfXYGkhZKsHlgrlmboqpHlfKtLgWu8hfCVg4XuzeNvlHGWO46MoH1qBfOrtN0CNI4YwT
	OlM0uY2jE4aVF1EIYr408gZd7FK+bFaf5GFYR2IVatURNotJnVmOq4VvKfqe+dikgly2NTMGE9u
	xULWrZvqFSRgL7ZKaGHQ8zGkecuLI98Hngxa2FH8FBTZEPhfW30qc=
X-Received: by 2002:a17:907:94c9:b0:c3e:34fa:611d with SMTP id
 a640c23a62f3a-c49be00bf6fmr469836966b.35.1793284980100; Thu, 29 Oct 2026
 07:43:00 -0700 (PDT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com> <20261029-gpio-vf610-fixes-v1-3-45b484b4c434@nxp.com>
In-Reply-To: <20261029-gpio-vf610-fixes-v1-3-45b484b4c434@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 29 Oct 2026 16:46:28 +0200
X-Gm-Features: AclHuK-5fF5L0EppdkS4D8ZIoBbTyK3ZL1smqB5yKpnauEf7H2xoksPh6zRmaVc
Message-ID: <CAEnQRZBsKsDGhABri5MwiPSL1EGC=a5=GfK9H_OX1jXcYnerFw@mail.gmail.com>
Subject: Re: [PATCH 03/11] gpio: vf610: simplify with irq_set_irq_wake
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 3:51=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Replace the manual enable/disable irq wake logic with a single call to
> irq_set_irq_wake() to simplify code.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
