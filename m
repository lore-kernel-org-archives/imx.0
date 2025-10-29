Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9A81A8F84
	for <imx@lists.linux.dev>; Wed, 29 Oct 2025 09:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761730346; cv=none; b=uXouAgczKifPI78M2VcldNQ0Ub0+/nLvmuEkPaFO0vf9XLt7lkINDRmKNDGOYcTM7wsNircV8FxbjEYytLhJyjMCV78tlUhGRoFe1tMC43xJvJ5bfbNDp344nsduedATz4qYtQlWUaZZTIb5vo1/7ohYKMhA9WTCJcfjluX1gdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761730346; c=relaxed/simple;
	bh=zHnOac0Axereq2RGbOFUBP+3/ezbkmVz1rWBPmLr1Eg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sqz80YPD5rqxwGbezGSVK+xHWrkVDs/vDme1SjJUy0e3/hRh3Dg+ADEy+eZb6JSpyGHvVbtvvDRPfC0v77dv6Kq4VPCYurEd/bEFdipDbAoB7PKVGewi22X+KxXOI7yFX9F1cyeHOHK1oqVPPN3oDvT1jKRsAzEQPH+LgEZ3o4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxJRiqCD; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxJRiqCD"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-29488933a91so70897765ad.2
        for <imx@lists.linux.dev>; Wed, 29 Oct 2025 02:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761730344; x=1762335144; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P7gY71n24jkS+kac1oyH4zGLv4Mgm4d4NB7g+mYr34w=;
        b=mxJRiqCDpvn6x44JYOEVLdVAqOXy6z5a0EL8ScJYN5wiXeV4Ehk+QNwh/gXlp0Xz2O
         D+JDIr6YRZqtYl4zoGno8Tl7EgLYBS9GiqAJL/OJsKUSNp/haydrITBy0onrSGcweBmC
         8plT68db7L0geM79xYWT/VUYM18Hf+qtattTPD2g1/1hB3Y77kbWzo69fJufByzB+t+Q
         xuPTJ7ZmQraCqscVMXNj+VRrbIPVe0ny2EiDzfgs18k40o8J1AwEV7kol9keh0/nR+Iw
         m2XCrx4SatyYPWjvoVQ6wQ52CmDga0jmo/R57nm2+qYzs3V/HZtD4NwwEb7B1DJr6i3C
         qjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761730344; x=1762335144;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7gY71n24jkS+kac1oyH4zGLv4Mgm4d4NB7g+mYr34w=;
        b=YEpYXjZdy32G/wEU5YDVPPjP4T9WWGXJj6DGzLmO+oJooL62RywBKh43e1YX/HCAfe
         VTjSioOv/rB8oom1FqD5isdfdkihT1RdkdG2HLrBhMFCiSZTxLqNjlfXj1L6drAIKhCj
         otXEdzIEDqazmaY+tGikj+0Nug6h3nXWkqiqDTTt6a1fmTMhEXgmpm/EmdBoq7Z5wINr
         M+qaTLeqYMlZ3nu0ShihrkNDweUMj66L9aJnoEtYlN6M8JYfnBeKLJt2i4wJdDJ67lLn
         7144q/ANLzMY+AVEEl7wWr/LaS25D5xEPPKMgPXBD7Y5DZe5jY24qRFOGl7/ahAJX9eb
         RFNA==
X-Forwarded-Encrypted: i=1; AJvYcCWCtJDzxv4amuPaLyLrsnImPnK21hayhZ7z7DddvoOotiq85nhw20ac9InubhGmDzQRqY8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxuzOVzJHz/3lnNGES2V/E+L/qv01LD4O0c3NQxBwKbzgTQvpXs
	xUqc57Pzt2DKln9Eha1A3JGO41wIUZIxrkL5TEG1EPI7l24b930RfYSH+El7haaUq2YK0HhminN
	wJ/dbXUduIA0BZYAxWGFXvE6K2ZLsrVY=
X-Gm-Gg: ASbGncsJoRBOmnm8rTizWyin8JnRXblEwm3Np1qt0ftJQ0EWYS4rPxMLZUFjCBMLGN1
	vYwcWns1t6AIJIb8iYCWzuWiL+6/hQz0bCx8y+JW4P4TVRlk7stW8QGhrXLHtSUzknDXap/EzgE
	gx8npAvvJEwtAdxIqTJpcpIk4mdxDU22CTcJoEUWNVrIMZjud7xFV1NV9Iyk3jrllA+ODRKZ9fy
	vMaPyS+MDXx0btrM6q3taunmbUn694lTIvv9VOfZen4wfiUJZSfWAFGCdAqrHesI9SKoFcDyr5L
	CVlZFVcDAgpgFQ==
X-Google-Smtp-Source: AGHT+IHEmOYvQKBTiwYrDdUImmONCxMn+7i+FjSXTPYthBD2JV4BFZY8+M8zns5YrqEDI2UCuQBIua+fHP0X5y03rTw=
X-Received: by 2002:a17:902:c408:b0:273:59ef:4c30 with SMTP id
 d9443c01a7336-294dedf1056mr30630685ad.15.1761730344236; Wed, 29 Oct 2025
 02:32:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251028-imx95-rproc-2025-10-28-v1-0-ce9e7db9edcb@nxp.com> <20251028-imx95-rproc-2025-10-28-v1-2-ce9e7db9edcb@nxp.com>
In-Reply-To: <20251028-imx95-rproc-2025-10-28-v1-2-ce9e7db9edcb@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 29 Oct 2025 11:34:49 +0200
X-Gm-Features: AWmQ_blaf6t3K-8uusFpzUZDxAED2sVeQ3XqyTQaNCspO1b_QKvTo6faDe6UlPo
Message-ID: <CAEnQRZD=ynKyJXGneQMwX6NbHaOPNr4jxnP_90Ed860kpKUN3Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] remoteproc: imx_rproc: Add runtime ops copy to
 support dynamic behavior
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <frank.li@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Peng,

One comment.


> @@ -116,6 +116,7 @@ struct imx_rproc {
>         u32                             entry;          /* cpu start address */
>         u32                             core_index;
>         struct dev_pm_domain_list       *pd_list;
> +       struct imx_rproc_plat_ops       ops;
>  };

Here do you plan to change a member of the ops table at runtime?
Like e.g replace just the start ops? Or the entire table.

Because it would be better to add something like this:

--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -116,7 +116,7 @@ struct imx_rproc {
        u32                             entry;          /* cpu start address */
        u32                             core_index;
        struct dev_pm_domain_list       *pd_list;
-       struct imx_rproc_plat_ops       ops;
+       const struct imx_rproc_plat_ops       *ops;
 };
