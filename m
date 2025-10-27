Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA902F39DC
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 09:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761558815; cv=none; b=CMlcQRWI23xafxe9ldAiuYzkFDAzBcWy2yTH4Ov0nEa4RA34lps7IYpho1nltN7n9XC000xc4og00Ff92D+KF+eYCwOUaWeOPmAtMWn/vSqSW/aLC4IfU+u8dV2rhS58LMlRkPT84Cnjkl41GG56xUnvCDClatYrR5RrXWYcNWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761558815; c=relaxed/simple;
	bh=uHZIvBo2w1MTfQAp1MbdkxhqheGGsSeb06hs1bU0eWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E1G/Ul07PmQpumfnk8mFEcydzEWT52V7eiQQBBdNVDr1CKB4v4fT0/DtxEeAC+sSLOmmELC7f/o1whDaeavsEzIzsJi1s7VRAjDLj8bOAz9W4boklX3l3GdMijv9fYa3qmCrCht2oRejm7GjwGlPnIWCySkZj2mTj9nIE+TSElM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFC65up1; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFC65up1"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-290ac2ef203so40874935ad.1
        for <imx@lists.linux.dev>; Mon, 27 Oct 2025 02:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761558813; x=1762163613; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHZIvBo2w1MTfQAp1MbdkxhqheGGsSeb06hs1bU0eWo=;
        b=hFC65up11VBO6+nr9aQ75Sp/BhJ1Og3TdGU5UjqF6WfTcDvLxFge5AXQbsQSRjDkkB
         ytIwejdCK0SnbgRieSgO0rdyo2Png7wnf9H702laegkEYqjPjjbxTZ0CTRkNzAOKi1a+
         IrnbcsjIBBHtyJEz5f3ngoo03g101i4tkfg0XGWGQ6on7fuTZUk516aK+Ba2fNZ0lG2L
         SYlFVhWgpVktxhdVD04E0R1QKQ8992L3Nrvk/9cHqP1goLp5d+d7NPcGRPuKHgHXYiKl
         DZuKH9VMx/b1MEKgX8viN+3rO0TZhowG77L2yNElvB35/ipJ6aO1Ls5UTPJ0xvIHndmN
         jYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761558813; x=1762163613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHZIvBo2w1MTfQAp1MbdkxhqheGGsSeb06hs1bU0eWo=;
        b=WQ83qj/0SIaiM77TdYq3A8BHSSLHqmzTx+s2oERPas3b1Mqi7E7Gn5ngR5pesNSasF
         k1U90cyMJUZF4t6/07UPPYutwIDyj+ZbDP7FLtZQKRb4FII5JMccNLsrkCVFcLBrhqv8
         KHwW3plh7pr80y7ed3LuiYWiEdYaFrUGP8lDL3uE0PZJZYzsiPvQaqJnukf1gwil+YAL
         EEujfh1HAAzzXsnVWuHayH3n2i939RzY5F8JBrSeFipuyQLoPcoxbLJI1Ky+cJuumsrf
         hUtzCIRxvrzmlUePcSYR4dhFTplkU6JSBTe1JZiamwpwaJyLDIa42xMmoMBYOyMx6eIc
         49Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUe6MADiWXrvtgUCnPLb6rqX2SzdffB114prCrTNR6i7bNdKlbt2omRm+l2G3u/MdXWdHw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBYjvgM4kHxKkkdiQEBLBfMl+zE0ime/s2NK44VMgWGuL3rpkn
	/Gx5Y1pyh6irr6i/SP+Hp79ZjL4Z2nn88U8J1SiRQrirkvGlWcBJOAz/PxWpvXCb24IUxwvtrBB
	piz+MxNgJXqZUMYJQtjNQau7+3EGOXPs=
X-Gm-Gg: ASbGncuCv6zB+EsByWgQPkHkpN6xYdhamMvSCPqJ0gcWy97sHxZW00aV/pIb0jQdOis
	zM2RbnJvRO0GAyJyDr/wFU7c8RVjiwYUFbRdJwsD1Bgf6qIBHiZcA40N56GKEVyM3Anl1g/xt33
	bdjpcOcq2x0vTpKFh5iyTcEinN5ij9lL7XQwQhXJ3nTNIoklmHrMMiNH0kqHHf6S5Mb5jYZK0zV
	lg/cFX0JHzoKdiwkt3R+rRluyEmGZd29JoDQpqPOGxah2oIZNwlY3sbtLU8bKyhPQOlPQj2PAh/
	gzY69stWCAknbqIFTML1nYgn7yyvoyNH55o=
X-Google-Smtp-Source: AGHT+IHtoK9BtAWkuBlb8wHMY81e3C7F/tuuKHdZ9dReVXpNyDrBKViu/Dmg9ERnj0atAtepiwCmQJhoe6CLgiAV9x0=
X-Received: by 2002:a17:903:38c8:b0:26e:d0aa:7690 with SMTP id
 d9443c01a7336-2948ba3e147mr140058725ad.41.1761558813104; Mon, 27 Oct 2025
 02:53:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com> <20251017112025.11997-3-laurentiumihalcea111@gmail.com>
In-Reply-To: <20251017112025.11997-3-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 27 Oct 2025 11:55:58 +0200
X-Gm-Features: AWmQ_bn8djVWD9T3hbxz5BaFzJdgRNmgPK4MMnk5oMPTdlZh7IbRd6rHqy4Tk8c
Message-ID: <CAEnQRZDXhb=ssjbL-SOWXN74pjqzKgwXQ3SUUaQYMJapRPgKFA@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: clock: document 8ULP's SIM LPAV
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 2:22=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add documentation for i.MX8ULP's SIM LPAV module.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
