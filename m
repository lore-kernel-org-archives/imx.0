Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D093546EF
	for <imx@lists.linux.dev>; Wed, 19 Nov 2025 13:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763560205; cv=none; b=IQhj+popqMZp2RyP/EnH8rEV0ldkqMbFqgjHcqypBC6rguFHhcbiA7BhCbQvJXjMqb0Eq9RHBslSVPc+MzhUJK8u9GnQUGYWlNhyHwfSyGsl0MYb1GKIczcUwzrbZfcsmucjSyl0JESj5LPfUiP0lYGukn7MSL1x+nsSTv+cs2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763560205; c=relaxed/simple;
	bh=PA3aR//XqqSLd6aBP1s9HW3fQNaQLmdD9BHhitJisII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RdNTnBTPgZYFxkF0LHEJgTiRzW6sjsB7+rjpJglEgnN32V0AbfznZaiMRn6ggvTwdYTSjfHUeWf5JJOEcW7ElBk18Iyb58du7kmUekkmz6IzIH6h+sdL9AyjUZC3nQbKTZmGjFC1iDuQRTXu48rSavHBqOgPVlhi2XvcNP3JwXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TF/CtObd; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TF/CtObd"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7b852bb31d9so7567351b3a.0
        for <imx@lists.linux.dev>; Wed, 19 Nov 2025 05:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763560202; x=1764165002; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PA3aR//XqqSLd6aBP1s9HW3fQNaQLmdD9BHhitJisII=;
        b=TF/CtObdLEmqzz1CTOgdbe6XnK/5C66RjhJoIiDxFxhOmj3UC+O+d7zia6Ys1vNW7U
         ZqDhVyPL1hqD3kIWOCqK8x2HbgWio3Yik/68bFW++okq3Lbz9kFvfQn8zwzIwdBb30x9
         YyYH+jRZ1YnCYAALByvtb7BnSm6bblMPLF3AUTRgcYCPNvobMAabSID9DYPRo69OJrAw
         TpgEAN7HG91x8VyKZYmXfWb9CVrkGqEyEXzCdkwmtohKTbChCmpV2BGIzop7bGbXCUJX
         PHqum+fEGQ+0hNJtYuWS2lxDOiFcIhgN7oAfgudH5RhzvhgxooxqOWmYZeZVsYQVGmmn
         8S5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763560202; x=1764165002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PA3aR//XqqSLd6aBP1s9HW3fQNaQLmdD9BHhitJisII=;
        b=RRoszok+mko1RcX9hdZnfe5AjkTjcah+4kZvPzngnLE+6PEDYRpZV5D9tjCQLlnAcN
         7KkRkrXf7C9cf81/Nmqk3F8gtbyr8UgM38KVxvSIK6otdhcrr0ZnYCiHyVt8SnKVx1uC
         AUK0BXC5f7SvitK6omlafOVYhXuKAvx5NDA/cpu7IXgQGQLDIoBF3fru87G3QgeN0zPn
         qS3ddxfG1yIIB/kqz7K5HQ1HRQBBirozWazaGv+uzw4ZnMhWwDhV5Kq+6lIMbJIuw71j
         E0RcaL49z/EabifzfFH/sQsEu1/XgOGjUa/bD1s2UiuFI/F92b9I9ij4zxwXupT32p7h
         OOEg==
X-Forwarded-Encrypted: i=1; AJvYcCWyd4nVtTARn6CAkgnh74sgrEX6MysAcpsSr21q9Q3XH7v5s/PigT8F10c1ybOgTBISBx4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzx8ahWU2jOh0Wij/I0UCZXQblDXwEiUMGBktaNxi4i8uLEb1WU
	a4HwRLlOKslKGw7i6K7ZTNkFNS7APiyeUBPW0n5HPODtI8mLpz076b19jal6wclRbH2P/BttBwN
	/vmtuDOwTFEFCrvvJJ3qO0Z4e/gHyGcw=
X-Gm-Gg: ASbGnct2qaNmqcoMPMjEcmT14zLt/Me43diR+LFWV0GSQP0fvDUqUeuuPWHK/GVYKWC
	0zkry6yvvUhEO7rS7SMwYbZfacyRkwe7nlIG5ggE/BPtpI+NsM3vPyB11ybC7P9fY7JmPnx3qzO
	MCmhP5hkBdZiZsn21ovlsu0mDilFfbjDHNRe/78RTSg6XpWkDU6DcYFvSgVrwDdafL2CEHuK8pl
	5FP6vqYIH84cYu1DdG/EYQP8syulpgTr00bj0vS2y7nU7E28kkxbTT8mVPymzFYKm6X3KdRmOd6
	mSh9759RW4aDnrl5J5Auc4OUqcPp+40/aWCE5h1OkjtVE9uRearRHwuucFrFfzysNxMLqld0N7z
	30FGXtoMtYMidx2fnPBXo
X-Google-Smtp-Source: AGHT+IGGVmLiseawcnvZbvhRX7fOL6QAlnymjGCnNl5Y6MJZz/aS1YjF5zsYCLKnAh6kSr2Lo387+JLD61i9on7r+MI=
X-Received: by 2002:a05:7022:6091:b0:119:e569:f611 with SMTP id
 a92af1059eb24-11b40faf26emr9338366c88.10.1763560202365; Wed, 19 Nov 2025
 05:50:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251119-imx-dsp-2025-11-19-v4-0-adafd342d07b@nxp.com> <20251119-imx-dsp-2025-11-19-v4-12-adafd342d07b@nxp.com>
In-Reply-To: <20251119-imx-dsp-2025-11-19-v4-12-adafd342d07b@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 19 Nov 2025 15:52:30 +0200
X-Gm-Features: AWmQ_bkuVDMyYfENLfIkZrmHLS5NB7j6e-0_rwXCFGVWssgFpyz5qyPLJLqiH7U
Message-ID: <CAEnQRZBMiZhEx0ziNbxpLLC1OK4CqNQQkYUncHcdGXe=mnJC0A@mail.gmail.com>
Subject: Re: [PATCH v4 12/12] remoteproc: imx_dsp_rproc: simplify start/stop
 error handling
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 6:27=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Replace goto-based error handling with early return pattern in
> imx_dsp_rproc_{start,stop}() functions, and simplify if-else logic.
>
> No functional changes, only code structure improvements for better
> maintainability.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
