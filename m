Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D92533A6EF
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 08:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765875014; cv=none; b=Npeu+MC5RLKqOQRSeKDq+s4YWNNfRXDO8rMLjKYP3ovtMpJyqZiNu837l7QKuxndsdyXFjpztx9Vv/xlRKXxxcUx+e0OBixDbLKfHjca4flC2SZObw0qMf7hd31t9ut32Jf5gGKH2kiX5iZtA3VcPDvlqJOPiM5FzpyptCsgniw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765875014; c=relaxed/simple;
	bh=ZUFe47qtGYjU5Yn2pY9F8UI7JZG74YZxx2wQ1k0dRgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vj426RAOGcihCWAXEDVRw766uslOTCo4ODM+zPYxFYDlMouAnLdEyamFLk9AxlbZh2SgvD2D4NY03o06kVx8fa6uuT1xIVawMZ5RBTjUNmnwiChBBMVIUrwzQuPBD+hQ/jL6Ot6R+sEF4Z79nH9fKOso46AVGkem+hTfaXVboiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LpVbgLi8; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpVbgLi8"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-34c3259da34so2965226a91.2
        for <imx@lists.linux.dev>; Tue, 16 Dec 2025 00:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765875008; x=1766479808; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZUFe47qtGYjU5Yn2pY9F8UI7JZG74YZxx2wQ1k0dRgg=;
        b=LpVbgLi81nBSfF+2LObyDtLJTq8D0Lk7Uli1ih88CqoPbxX6dNOKy3koz7NACBlQjV
         kmZ+OJwC8ZwwR0Rf2ZlraCARqNpGW6Y4uA8w5sN6gb9Hp9147NWtl4fwxdZSWcvpMQBE
         OaWRfgF9i1qniMNnpqW0PEhU+XqTvkVjnQNy6OadAXFp5eLWYqq3T0XML4utQNPTgCZB
         Y52ci0vIJB9mVENnzO1GzOYB94Aj1v3I493MKAWuzCF2Q99GmCAne2UWjKpDzFgFzfbg
         bm+UEeFUm+Np39DIheb+ltxbbqVRWaTpUwfNvpT0n21d+oUxiURlNK66nlIpF+XNJUnq
         U3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765875008; x=1766479808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZUFe47qtGYjU5Yn2pY9F8UI7JZG74YZxx2wQ1k0dRgg=;
        b=JBHO2OPPqczdmvWUM0EiraJi7MT95CiClhJdlBvtTFKHn9LyYGP0ANlrMt+q0hwP6A
         PyGinnqGUCYtInQM3HGePpQaLnJXS+1gyHwUeciJ5lMKeo4/RvLjRgZCf1yWkOcng58+
         rcxUP6kwyb83pLeAnXJCZGgI027TpC0+QHZ4HGPPpvnF5ppelejmrzJUkVzH3ZEOQSN5
         0LQA59ZQvfAtyiaWLdL4MtGEKybmsdjlPOBj80RJneqH8gNIRwP/GZ/jz4Ts1TPq3y6l
         1p0Gsw0ty3zdpPOFaMRbenwED8JqO0M6BF9AH37bRvyR9Ergsd7mE7TzncYRXnRLUv+g
         7+Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVAhpjrngohY8p2NW9JGPLmswofhFe17eW4TZCQkh9RgxnXHEq57rBRJMCUalT/IWegyhE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxyU2FFBf2ubiGaLzstONpVJW8CSrqqnjLbDe5GvzPlgm/ksR/p
	NB8yBEVDN+uOCgZuGj1U/afqjU3NsoO9DxLSOFVbpegchDHjBC55V7C8rD2Mkra+GC1Q2uXRfUN
	dpAfTf02qXG8gRSIsiQ3IKmnahW7jdHI=
X-Gm-Gg: AY/fxX7rnEt4DIAwB8+/TnTYy5YvdAl6LA9l4HUQCedMFE+XCtbwBzva2t3RNy8YLJq
	HcsVfdznpctx4Rp2pUBUoMqsfvmpQ7NN3uHZp3dEO034Gii6xJMRuPx4HiGQA+BsJyx1/OMzC8C
	TaLObS6IttA/Qq7Hby/BAo53WLQ93qHMaNMTf5tOE7avNBHCO2nMOamuAc0qR8XLr0IT4+7vtq9
	AoAfDwUIM21+x6p+ZclFj2aMCvWurA6gAvGR22oexNCIOw1RU8RrbTk3X6TMCLpvqeqNwmSZ8DU
	zd+dASR+jbD8XuImou18uM2mN0J+P68WPilH7oteXkYavFfRc6uk+QYDUIwP40OnIs6iXmmwW1o
	koTszj+7atjAte428K24w
X-Google-Smtp-Source: AGHT+IFdZYFT+NIwzhAXA50MF6zrj86tN0JwKIahPILeOcWuOCFok0qYlbb+VZx5E16t5BM86z6amXtW1CuiK+Z1D7g=
X-Received: by 2002:a05:7022:5f04:b0:11b:88a7:e1b0 with SMTP id
 a92af1059eb24-11f354cd726mr6498824c88.26.1765875007985; Tue, 16 Dec 2025
 00:50:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251216074216.447193-1-shengjiu.wang@nxp.com>
In-Reply-To: <20251216074216.447193-1-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 16 Dec 2025 10:52:38 +0200
X-Gm-Features: AQt7F2qAJy_LSqPhNedKh08SXl3wUZHMX7Nrl3yXqFHsKDgpXLFzkxbItF2FoEo
Message-ID: <CAEnQRZCZe3z8F7TsFdCz5P6mu6qzGkdoqC76XkyCCzQz+pSpmA@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: imx_dsp_rproc: only reset carveout memory at
 RPROC_OFFLINE state
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	daniel.baluta@nxp.com, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 9:59=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> Don't need to reset memory at suspend and resume stage, because some
> memory is used to save the software state for resume, if it is cleared,
> the resume operation can fail.

I would rephrase this as "Do not reset memory ...".

"Don't need .." suggests that this operation is unnecessary, but not wrong.

With that,

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
