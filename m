Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FC223E32D
	for <imx@lists.linux.dev>; Mon, 22 Sep 2025 11:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758542074; cv=none; b=F5yl848pERpfg4GD6cJebz+Rx+xPmSeSbk8Nq5o2rlgHuWb6q2e5QGLuJVA/2OxJ1stXQ2FJtAXrU6RQIUdbRXt6RESOAqtpLErHOUogOL24/hUbmOchcCwdbc/flFLXgXBJrC4ajr/459ieEMhRlLDRJ7SzeGMjywQvamPcAW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758542074; c=relaxed/simple;
	bh=H82PriZ9rjpzbtA4cB7LLdyiPEBtTfyUNElybLELZfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r73h3svwVesetWw8uJ9XQytTvEjD/7CtHLmXyeGODjCFiWam3JJ5lgHiobwAgJNMONwhd/dCgazYQEWGbqFB+FUd7IX73PI9e+FObUOvFW7YP+ulWL2rGwej1eU6icRT6KLKzGgQlzsXutNdf61v474PW4B92JThLEKHJJoLRrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWri6QtH; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWri6QtH"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-33082c95fd0so3570456a91.1
        for <imx@lists.linux.dev>; Mon, 22 Sep 2025 04:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758542073; x=1759146873; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H82PriZ9rjpzbtA4cB7LLdyiPEBtTfyUNElybLELZfU=;
        b=YWri6QtHopkUHeVGIS01py7na+1zHvDJJnvvL3vXwBT7aZ1OG7vu4fQ4vk3GNKnBLz
         SpPAeRS1ERmeHIsFyTe7Q4kmy5pg1xh/fouwU8ijVjdSQdKaWDeGkT774qdUl6lV2zLC
         +BdVdHHS36sYcmYa5bPx21HkY7TFrJYI5y6GSrnfUrkos5+7IecC9fAlNxS+PtZzkg+X
         lGsBXEFAfPoDZ1274Uj6gCZMzwpVVWHa0mt3ypVw2+MWS5GyMds5ksXGXUNjPVPc6yXj
         /g0i39n34b7i49MAnhatL2AZ1YVYpH6cInFLDvY1ckRtfBoUcRmzPIiO2OHxsODR78eY
         6Qcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758542073; x=1759146873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H82PriZ9rjpzbtA4cB7LLdyiPEBtTfyUNElybLELZfU=;
        b=hIusbwwj6JD3x1qA4bnn/rjbjnXw/uyO+idNkiaoI2s5Fz23CBm3w7qlLduDZ+JImx
         wYcCpUGIrO1ECO3K5Yu0dItg1MX8EqmJE5S1mAd0MTP4dgPsJ7xQ65Y2Z9FSmnd9mPwQ
         cKa7WEgwTeueJfKHAp9MSR02ofxjNVI1VdbrvUpUkB+Abeg+ycwdH+QAcXrGzQZJdtBE
         DqKrjFkPOEM02sN1kTU2jWUo0tq54uwLz95yXqMNiHnmAoeQSzrVU3JYXRXNoBJQJiu/
         oddHUf+jR3E/UKPuz3ty1HaQjQHhLw2O2bo6k2unvoU/9Zh9BChlOrs2BL3iDsawoRYN
         x2Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWyjozE4ng4RH0PS5cwtyrxq/D6AH0b7FsQNNcJRrGR6AnifRAhnBzTbx06j9r++oEnmn4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6xBkfn+T0JDKJ5MqL4G1ZEN0J2DpsTnbqXd6e23R/nle7GPbA
	ZHpEekMSnATeV6bSuyCV5LHNlMVd9VLUuzBlO+zGlnKwY5ElPCJOCSetQyRik/bpvgZgmIqy2hG
	fZuTBikvOEbpXj/Ua/FC3sqqrSR7NcyU=
X-Gm-Gg: ASbGncsPyIbPkcWgYo14kr1QV/O+jdzzy29hRRSUWqQ0VkqbxwvBgOSmsXNfhFeCxMk
	ZkpuKsei2StPsZ5xjTuxUYE9GI7j6rlaQe9FFD4E6h8UzXWTFs4/SW0V7kdt2yn+OxoV/XU7tA/
	C7C744GUmaH5ofh5MgZVy7QcexZE9JQV/UKcST4wnepdhEfy1pxO1n3qxK/MFIT7s5g0LBKjn9Y
	QY0G2Vcp2QAM0pQ1U835Dxo7Kznbf7FXajI67PVIU1xir4=
X-Google-Smtp-Source: AGHT+IHzxM4yiWZAL6zxD7pQbX0TaeY/bJwW0LY0llQOlSdS3iORCuACnssvnMbvtQZrqfxj7+ITUfMjGupBB0hJduI=
X-Received: by 2002:a17:90b:3d44:b0:32e:a6b6:6d00 with SMTP id
 98e67ed59e1d1-3309836d4a0mr14833310a91.25.1758542072686; Mon, 22 Sep 2025
 04:54:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250920-imx_rproc_c2-v2-0-3351c4c96df5@nxp.com> <20250920-imx_rproc_c2-v2-5-3351c4c96df5@nxp.com>
In-Reply-To: <20250920-imx_rproc_c2-v2-5-3351c4c96df5@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 22 Sep 2025 14:56:48 +0300
X-Gm-Features: AS18NWCo7SM87IX5gqcum6VQNj3ji3-ObJeD7tPNQaPVNEbSqpL0MuoR10HuEnI
Message-ID: <CAEnQRZAtNCzoPdY0B=NXxKZte46XuVSNm-cSkEj9mUr7TF5BNw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] MAINTAINERS: Add an entry for i.MX remoteproc driver
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 20, 2025 at 4:16=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> Add an entry for the i.MX remoteproc driver
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Acked-by: Daniel Baluta <daniel.baluta@nxp.com>
