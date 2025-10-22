Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCC430146E
	for <imx@lists.linux.dev>; Wed, 22 Oct 2025 08:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761120606; cv=none; b=B5umwbVwaLdR0lL1/qB5Sq+c90zuJAMayP4H2KCCB9azlCUnFyIeNaY9vn+a4n930x3vouihE5BzehT/d3TdQYaIwRCRDz1Vw8pC+1RwlmJQJMfh8wKIxPho0jfpP3UeLiX178Hyp4Cwx/9HvBfQxRJSuSKKg6RzHQw9h7QFQBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761120606; c=relaxed/simple;
	bh=HEmnc5vMpi6b1OrbGAVQUc2U3zcPJKxRDOHC8XlWCio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PQn6aPjF29m6csuwdDgJCSCxHI1XCYxQ9767iZa2eNmZNYdB2TekwDtlogpIjX5Qq4foc6htiI3aY+jevsGjBaOx2Ttzx9ZwTAU9ZMiMJKEl6dsOw+S7uEaR7kbTpGFG+PI4OKrcZ8HQpbq1PO/1UvmcCkWcCyS49PIWP+RGKSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ax16SQLa; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ax16SQLa"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3304dd2f119so5155607a91.2
        for <imx@lists.linux.dev>; Wed, 22 Oct 2025 01:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761120605; x=1761725405; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEmnc5vMpi6b1OrbGAVQUc2U3zcPJKxRDOHC8XlWCio=;
        b=ax16SQLa2labKsqcWGpJh6G05p+ebucGjn6fH15hZGii/ltTZJhr/GjPSnCmrJqSim
         AZ/gjwyRJvEm1gqy2hFpaFv/D7Rxc7UtoTKSj8hiKfYeIFJNeq34LFIS1P1V2yCzKjrH
         pe6FeJcvVpq051OoS9c4LMkVOsks0PvycLDEZlgivIme2huXOmKeIP3Q8hz7dwo9RCqT
         mJSGGF2av6eQl/7b8QLFpMQT3vwrMY8JkXWMAoEnWHGZWyIXEc9GlDGKf3JZUZPZmzuN
         G0+ZOoJKY0FZd0lVCrx3NP4F/ePoeSGaWNoltE5JH3wl0SzKu84J41YHXNOxSQf2Dvic
         26XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761120605; x=1761725405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HEmnc5vMpi6b1OrbGAVQUc2U3zcPJKxRDOHC8XlWCio=;
        b=cCjNf0W26uJF1mm9L6TZthLXhMeNXuWhl+snZXVcU5380iJd2UHvqitprTC8/KUlRl
         EJeu6LkEucQcanB7cYVVw45e2FarUZuFmUayrftC8nGVJHN8f3x6N1j7K0mAk5rGw48U
         aFv9I+63KA99q7lsdqUtcCNlaoYKITkG92VvkqX/t/hj5o4AKPgiFCRbAMomBxC/qW7A
         +FGK7lWLWLYKKRqXqoMkTslsgPha4fI94GB92JADDKlTFIr7LOctnJ43faCli+5lIXz9
         yRUymumpZNId0/pVrR9qz8FqJRwKMIkWU6jsHosiWI8xs4es1p4s6VpoPfMg+yMfcZ8k
         Iz6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBcMX1jegTJ+xrLifo/A6pV6rNjThBb7UU+CgTUJJ+JVSkdN/xwmZzKszzICScGZcKZ8Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi/YPtOZuMBqJmCkVVziVT/FVUeSGhSJC3n9Nomo+qdJD+qAiZ
	761Fif1kETpX/sDPNvObEciU6nxyG3x1jQm8vvElgvhLU0gkAGtkVgE3zJNKQyeAZ7q0Zc1r6vH
	1nyLKd20NvbNFC7JzG1vnLtXUfItR5eM=
X-Gm-Gg: ASbGncvLR2gVSRhG/1dqA4sUSL/H/W7HFtgOnQA+eywNU1cvVFcMsbFhu5yy3R+TXmb
	ZIezSuYm9HDHP876gbplXDHHQixpi8yK+3icysOsFn9yLxcdQCjFfjr1vG5McxFWerj4g6BDwS+
	T9qOr9wJfRpEKGtw3r1sU1jGGFKdGrj9uVz5jl+Ndx4/eqmdj2wtywzRgJrA86CXr7OsiNvX3KE
	HNobWIcwDDlFRhl0NU/PzD8yDdryTwpOrTAJ9UqPTVsJ2EO3W7p821KQUPj354RLapTzkhC9DMP
	M7pjKOqZ6p6mXg==
X-Google-Smtp-Source: AGHT+IFsRa3NbzwE1QRZLbALMdXqpaiYhoZrvFInF0ZoI78jJyRZgIJgbztvKnV2w5sJzHcRyU/kiI/2UoR7hH/UHaU=
X-Received: by 2002:a17:90a:ec8b:b0:32e:d011:ea0f with SMTP id
 98e67ed59e1d1-33bcf8f7280mr23198312a91.25.1761120604592; Wed, 22 Oct 2025
 01:10:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251015-imx-rproc-c3_1-v3-0-b4baa247358d@nxp.com> <20251015-imx-rproc-c3_1-v3-3-b4baa247358d@nxp.com>
In-Reply-To: <20251015-imx-rproc-c3_1-v3-3-b4baa247358d@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 22 Oct 2025 11:12:23 +0300
X-Gm-Features: AS18NWCHR6zWPh0Lhyj7NW_5VyV1sIwtSk-03hUxmGwwLIGzWZKXfT3yeFbQvzs
Message-ID: <CAEnQRZCtffKGvAUdB4T4RdRDP7VBV3Nt=xWZBXNtRzxedd73Hw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] remoteproc: imx_rproc: Enable PM runtime support unconditionally
To: Peng Fan <peng.fan@nxp.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Frank Li <frank.li@nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 4:54=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> PM runtime support is safe and applicable across all i.MX platforms, not
> just those using the SCU API. Remove the conditional check and enable PM
> runtime unconditionally to simplify the code and ensure consistent power
> management behavior.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

Thanks Peng. Makes sense.
