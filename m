Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794869477;
	b=nvd60kxM/ySY7vWxYIgbMYM9PrrssSm8JMo0IjYBFBQxuQ16DXNflDKGfxvZG8APEDLR
	 AWY8QPcNoRhkzy9u5D3FkaJidvBUZL4m8khiKI4y/eU6kXyy5mEOsEqRcVuw5yVfcCtca
	 4Q8tA+makW6h6BGIvurCyjYAiIT7/VemD2lOBPeb4/tLQlSEKPH6HfbPO5/ZHu9FTVMhD
	 /TrlwUhOJJ281lunN/YhQwXaQFTDHMwxU+F7BGrOk+zEzqRzrh8nqBlvGSuilAU24u6zp
	 2rjAbyPyidsMk+Z/gEo27MFlpUHIZqA0kayMTzdVA/9TiZOtdMddQ6cxFEZHUZfzfww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4R6GMf+N1WSGNe7ynv/fMp2cLGWJ15ixMnxyfrCx9Yw=;
	b=i6VbCrTkSH0UIicxBMe0yJTqPDQoZ2q0oKpfN8133qM5w5XhFFh+XMroEBVxdYuqEkmA
	 5i/lpzkGzEyn6GwX3Qep110GpQEkyFWsjE+8k/Y4lf0xI+yhI17TTOCtCMuLrco2uwRxU
	 gjAP7wmw0cR18R+cjbRYz1vzgF/jjSG858QtNANNYdqkP8qrmRxNtOZ0gYGOqnxvTo6yq
	 ksXj+918CoXWPy9czSdGdtZDXRnwdsS1lDrAV+b7RnA5jV6NrtMJ/b1phRouZw2ZWFU9x
	 +TFteKPFHN+F6HwFToMKquHrTIBhgJ2YOvFwQTmE/bvBXi/IDlaRNy3P+m6q7sSQQPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="i/PqAoE1";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DE2606A32C
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 22:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06DE2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i/PqAoE1
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bfa7c09c9eso3260369e87.2
        for <imx@lists.linux.dev>; Mon, 16 Nov 2026 14:51:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794869475; cv=none;
        d=google.com; s=arc-20260327;
        b=sbNrqanu/QBjU8OkVZ0rv09QTDFt4WKCUrbz45MYqYo8Y8suU6xZWsuzVGGG1M6qUR
         1WGRnL4bzQGM/Np58weQCk54zhqZ5eMr6/Hhxe56rN0yKTm79u//3IU/Zepy3Qm/uPA6
         lt8HKPN2QDBP1QOnVsraPv5dWJrnzvWMg6uPZnwbsb5cdXIUJ9J46GDo8zDMiUIC8Qf/
         TkbCH5fuMB9Q5e7OnrE/hOrOXPKc9CkliTeKeTecKRGrKOmdjmKqffO48KP/Hvf29g2M
         qVduwZ0SZaaFuxxplIj+HgRwYNXuzgEfXt1eA5vPjkHn1X3SuRhCkUuU9DnEBfb5FBMl
         p3Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4R6GMf+N1WSGNe7ynv/fMp2cLGWJ15ixMnxyfrCx9Yw=;
        fh=bZTGsYqTdPvbLkEPBlxVg0YQapFz5qoT7YXVs6oe0j0=;
        b=aZMjYVBnsfIZ//i8DcH2s2TJBdW1Xujm0gImFDvrJZ9mLWvjHUX6CFkDFuswn9lkQF
         0FIf4EjaU4HEc4nh6En1lUP+wR7vUmFpVuJV/4SkRvNRjoRJZS8IC7SFUefBTtIgfVzy
         42q49pNlvc1KevGBW6KOLqhnHL31xcsWfvmqT9cw/tJGMp6bKUQn60+cHeqCVTcNsIiV
         z4KRVp9hc4jrLgFWuJn6UzX+VICt6PL8SYk4gVWo0mblDoh6AjL9Dy8n/BYIMkX8Q7qC
         fpmZ5OiFM2mVK1smwiwMSFynSiOZlK/RVg/iiJT5r+4BzLNGnAifdQcqkMQdYglbn0MX
         dzBw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794869475; x=1795474275; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4R6GMf+N1WSGNe7ynv/fMp2cLGWJ15ixMnxyfrCx9Yw=;
        b=i/PqAoE1/kPFQN1tJPckyQIp4inbHV2tEgQNzwJ/ioys7X3t/V+H8N39AKd7+rxKRd
         U/L1Dzala5xDas6SqUvgURX8cPnTFaP9kWiNuNO+9NYfPPYyoff8485xWSW79d/1YOsG
         Xg8e+tnSxcDvOkDnj0nRro4lvuTrO+lSg5609ovQjsfqo28AO15EIkqnNWvUF2SjrwCm
         dGvVkoLk/9lTQF5oJZfzqr1JSjW0O5BW8RbS/Jcmb4oAMEtkepzWqB9QVvdmq9qkTEmE
         4m/0zrj/N/xXgZ/J8B9SnGtuP2sY1HK6iTNa4sjDtpQCiH6UjZwd92H/BB0sPbCzLEoE
         ajcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794869475; x=1795474275;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4R6GMf+N1WSGNe7ynv/fMp2cLGWJ15ixMnxyfrCx9Yw=;
        b=tZRRfP7Byn+lX87f/SyIptkb4vFjSCVDxVAvTxoOMkjiMefXfs+jzuTePZ8nRXl94J
         QZL2B9U1UNarX0iLcgfaI5m1AK76qhOahqNiJTvTfxTmtU3FSGQYn0l7ovEyGc/EBKxp
         beoQi89PBK0B6JpSZz8DxP3awd/5Nzlxz7osR1exxN2M7sXboInLrFRd57yTlR4i+Sf6
         /mq3pLW6EfyZUkcyNYTJhy1liKHwAwAQeuh6iGnLGVDXm0Z0hpsjyDFMkQF7Nwymp2UC
         slmPoxknrse8OJ7t9m+fRHbPhozTv/Q2jAqZu3xVwAAO2bD2MaHYiedagBNE/j7l5/Sy
         6n6A==
X-Forwarded-Encrypted: i=1; AL+hErHjIu95E1ohi2kFwZmb75P231ekZ9ENTEfdliN66dG3g/MhYggsoCces7Dr7SfZSqXUIkw=@lists.linux.dev
X-Gm-Message-State: APuU4Z9Qzbo1Og8c6VmnEY5BOFKfef5kwF1IkXrik51WWKEOzcEQ79Yw
	LnZPN4CLIY3yScan3hG57ROW7f2Pry+k8xRF9S6ELMJ7H7sBa6r74V1yRcrD/X7U4QTwRSyrIz4
	nBhBYQ6CC3n6aOEF49QOmffYjkG84vwE=
X-Gm-Gg: AYBFou1VzB+kgKiY1qzZCT3s1WNMJiLTUXiQ0fk5dauyw0PIvHRHh0RfSmyaudC+ZXq
	JtZngcXoxh9wU+iMNnX/EectvHmE+l0OEhawxAYrUW/3THjN736LLk3al91UQs914xBL9Hwzvj3
	k5yic9CKBaRD0NQcq2qvgx/BTF/fOcJJVQHw+Pr6YQkVhx24JGdDPYC+NuJdp0n7lNbxCVFG3Is
	AfVV4agHoG79l8IT+tcz1n9HvS5s8eymXbkGqKUMRAmYFkdBKiPm2aELHgIAWV2Ja/pTfZ3RjTB
	udpVUhWcAEDvStffDxlJpEiv5h1NnsQG6uGbANp3H4YM6fciJeRWh0hXqphsOiKFt7IcOCgbFnL
	xlISfo1bqoQzm74xZqdyFeiXPelHsTxyExtbfqFGrykj6ZxxCk9xLsoXQCgoMaUNUKlOo5B+EBz
	iRIXf8IXO18ix0HzLLdrGyHF1T2g==
X-Received: by 2002:a05:6512:31c3:b0:5c1:4f6f:564c with SMTP id
 2adb3069b0e04-5c1709c5b64mr4475988e87.39.1794869474886; Mon, 16 Nov 2026
 14:51:14 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116224803.61154-1-festevam@gmail.com> <20261116224803.61154-3-festevam@gmail.com>
In-Reply-To: <20261116224803.61154-3-festevam@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 16 Nov 2026 19:51:01 -0300
X-Gm-Features: Aa3M54oXe-IAn7x15degHvby6uCIkABaEwDsnl3MJEDi4r1Iu6Ak5t9VY_ssJ7s
Message-ID: <CAOMZO5CPym+AYFLv7D-mAH+OQXL_83yForV3GaSk4ReT_x1HrQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] mfd: mxs-lradc: Pass parent IRQs to child drivers
To: lee@kernel.org
Cc: maz@kernel.org, andy@kernel.org, jic23@kernel.org, 
	dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, mfd@lists.linux.dev, 
	linux-iio@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	stable@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 7:48=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:


> Changes since v4:
> - Map the LRADC MMIO range once in the parent.
> - Share lradc->base with both children.
> - Remove duplicate child memory resources, preventing the unbind use-afte=
r-free,
> as reported by Sashiko:
> https://sashiko.dev/#/patchset/20261110141934.42490-1-festevam@gmail.com?=
part=3D2

Sorry, the correct URL is:

https://sashiko.dev/#/patchset/20261113013212.470981-1-festevam@gmail.com?p=
art=3D2
